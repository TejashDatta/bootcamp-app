require "rails_helper"

RSpec.describe SiteVisitor, type: :model do
  let(:site_visitor) { build(:site_visitor) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(site_visitor).to be_valid
    end

    it "is invalid without name" do
      site_visitor.name = ""
      expect(site_visitor).not_to be_valid
    end

    it "is invalid without country" do
      site_visitor.country = ""
      expect(site_visitor).not_to be_valid
    end
  end
end
