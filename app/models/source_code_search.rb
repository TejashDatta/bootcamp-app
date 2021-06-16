class SourceCodeSearch
  def initialize
    @results = {}
    @expression = nil
  end

  def search(expression)
    @expression = expression
    Dir[Rails.root.join("app", "**", "*.{rb,erb}")].each do |file_path|
      search_file(file_path)
    end
    @results
  end

  def create_identifier_matcher(identifier)
    /(?<=\W)#{identifier}(?=\W)/
  end

  private

  def search_file(file_path)
    File.foreach(file_path).with_index(1) do |content, line_number|
      if content =~ create_identifier_matcher(@expression)
        @results.fetch(File.basename(file_path)) { |key| @results[key] = [] } <<
          { line_number: line_number, content: content }
      end
    end
  end
end
