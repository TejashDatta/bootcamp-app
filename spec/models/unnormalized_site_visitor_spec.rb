require "rails_helper"

RSpec.describe UnnormalizedSiteVisitor, type: :model do
  let(:unnormalized_site_visitor) { build(:unnormalized_site_visitor) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(unnormalized_site_visitor).to be_valid
    end

    it "is invalid without name" do
      unnormalized_site_visitor.name = ""
      expect(unnormalized_site_visitor).not_to be_valid
    end

    it "is invalid without country" do
      unnormalized_site_visitor.country = ""
      expect(unnormalized_site_visitor).not_to be_valid
    end

    it "is invalid without browser" do
      unnormalized_site_visitor.browser = ""
      expect(unnormalized_site_visitor).not_to be_valid
    end

    it "is invalid without browser_developer" do
      unnormalized_site_visitor.browser_developer = ""
      expect(unnormalized_site_visitor).not_to be_valid
    end

    it "is invalid without browser_platforms" do
      unnormalized_site_visitor.browser_platforms = ""
      expect(unnormalized_site_visitor).not_to be_valid
    end
  end
end
