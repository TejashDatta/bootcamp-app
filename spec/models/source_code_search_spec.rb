require "rails_helper"

RSpec.describe SourceCodeSearch, type: :model do
  let(:source_code_search) { SourceCodeSearch.new }
  let(:search_expression) { "show" }

  describe "#search" do
    it "searches for identifier in all source files" do
      expect(source_code_search.search(search_expression).count).to be > 0
    end
  end

  describe "#create_identifier_matcher" do
    it "creates regexp for matching identifier" do
      expect(source_code_search.create_identifier_matcher(search_expression)).to be_a Regexp
    end
  end

  describe "#search_file" do
    let(:file_search_results) do
      source_code_search.instance_variable_set(:@expression, search_expression)
      source_code_search.send(
        :search_file,
        Rails.root.join("app", "controllers", "users_controller.rb")
      )
      source_code_search.instance_variable_get(:@results)["users_controller.rb"]
    end

    it "records line numbers where identifier is found" do
      expect(file_search_results[0][:line_number]).to be_an Integer
    end

    it "records line content where identifier is found" do
      expect(file_search_results[0][:content]).to be_a String
    end
  end
end
