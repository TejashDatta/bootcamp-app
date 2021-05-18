class HtmlLogger < ActiveSupport::Logger
  HTML_FILE_PATH = "public/logs.html"
  PARTIAL_HTML_LOG_RECORDS_PATH = "logging/log_records_partial.html"

  def initialize
    initialize_log_files
    super(PARTIAL_HTML_LOG_RECORDS_PATH)
    @formatter = create_html_record_formatter
  end

  def add(severity, message = nil, progname = nil)
    super(severity, message, progname)
    write_html_page
  end

  private
  
  def initialize_log_files
    File.write(PARTIAL_HTML_LOG_RECORDS_PATH, "")
    File.write(HTML_FILE_PATH, "")
  end

  def create_html_record_formatter
    proc do |severity, time, program_name, message|
      <<~HTML
        <tr>
          <td>#{time}</td>
          <td>#{severity}</td>
          <td>#{message}</td>
          <td>#{program_name}</td>
        </tr>
      HTML
    end
  end

  def write_html_page
    File.write(
      HTML_FILE_PATH,
      generate_html_page(File.read(PARTIAL_HTML_LOG_RECORDS_PATH))
    )
  end

  def generate_html_page(html_partial)
    <<~HTML
      <html>
        <body>
          <table border="1">
          <tr>
            <th>Time</th>
            <th>Severity</th>
            <th>Message</th>
            <th>Program Name</th>
          </tr>
          #{html_partial}
          </table>
        </body>
      </html>
    HTML
  end
end
