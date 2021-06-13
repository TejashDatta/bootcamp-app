require "rails_helper"

RSpec.describe Browser, type: :model do
  let(:browser) { build(:browser) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(browser).to be_valid
    end

    it "is invalid without name" do
      browser.name = ""
      expect(browser).not_to be_valid
    end

    it "is invalid without developer" do
      browser.developer = ""
      expect(browser).not_to be_valid
    end
  end
end
