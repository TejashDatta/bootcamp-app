class HtmlLogger < ActiveSupport::Logger
  def initialize(views_directory_name)
    @log_records_partial_path = "app/views/#{views_directory_name}/_log_records.html.erb"
    initialize_log_file
    super(@log_records_partial_path)
    @formatter = create_html_record_formatter
  end

  private

  def initialize_log_file
    File.write(@log_records_partial_path, "")
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
end
