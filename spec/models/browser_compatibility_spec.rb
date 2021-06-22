require "rails_helper"

RSpec.describe BrowserCompatibility, type: :model do
  let(:browser_compatibility) { build(:browser_compatibility) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(browser_compatibility).to be_valid
    end

    include_examples "attributes present validations", :browser_compatibility, %i[browser platform]
  end
end
