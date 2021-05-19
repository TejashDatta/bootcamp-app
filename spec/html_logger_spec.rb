require "rails_helper"
require_relative(Rails.root.join("logging", "html_logger"))

RSpec.describe "HtmlLogger" do
  context "creates test views directory" do
    let(:views_directory_path) { "app/views/test" }
    let(:partial_view_path) { File.join(views_directory_path, "_log_records.html.erb") }

    before do
      Dir.mkdir(views_directory_path)
      HtmlLogger.new("test").debug("Test log write")
    end

    after do
      File.delete(partial_view_path)
      Dir.delete(views_directory_path)
    end

    it "writes log as html table record to partial view" do
      expect(File.read(partial_view_path)).to match(
        Regexp.new(<<~HTML)
          <tr>
            <td>.*</td>
            <td>DEBUG</td>
            <td>Test bog write</td>
            <td></td>
          </tr>
        HTML
      )
    end
  end
end
