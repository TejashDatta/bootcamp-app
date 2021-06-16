module SourceCodeSearchHelper
  def highlight_identifier(content, identifier)
    highlight(html_escape(content), SourceCodeSearch.new.create_identifier_matcher(identifier))
  end
end
