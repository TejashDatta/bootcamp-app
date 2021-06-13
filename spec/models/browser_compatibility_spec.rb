require "rails_helper"

RSpec.describe BrowserCompatibility, type: :model do
  let(:browser_compatibility) { build(:browser_compatibility) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(browser_compatibility).to be_valid
    end

    it "is invalid without browser" do
      browser_compatibility.browser = nil
      expect(browser_compatibility).not_to be_valid
    end

    it "is invalid without platform" do
      browser_compatibility.platform = nil
      expect(browser_compatibility).not_to be_valid
    end
  end
end
