require "rails_helper"

RSpec.describe TechnologySummarizer, type: :model do
  let(:technology_summarizer) { TechnologySummarizer.new }

  describe "#summarize" do
    it "summarizes all methods and variable names from product code" do
      expect(technology_summarizer.summarize.length).to be > 0
    end
  end

  describe "#summarize_file" do
    let(:file_summary) do
      technology_summarizer.send(
        :summarize_file,
        Rails.root.join("app", "controllers", "users_controller.rb")
      )
    end

    it "summarizes variable names in file" do
      expect(file_summary["variables"].length).to be > 0
    end

    it "summarizes methods in file" do
      expect(file_summary["methods"].length).to be > 0
    end
  end
end
