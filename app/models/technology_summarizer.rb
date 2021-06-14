class TechnologySummarizer
  def initialize
    @summary = {}
  end

  def summarize
    Dir[Rails.root.join("app", "**", "*.rb")].each do |file_path|
      summarize_file(file_path)
    end
    @summary
  end

  private

  def summarize_file(file_path)
    content = File.read(file_path)
    @summary[File.basename(file_path)] = {
      "variables" => content.scan(/@\w+/).uniq,
      "methods" =>
        content
          .scan(/def (?:\w|\.)+(?:\(.*\))?/)
          .map { |method_declaration| method_declaration["def ".length..] }
    }
  end
end
