require "rails_helper"

RSpec.describe SiteVisitor, type: :model do
  let(:site_visitor) { build(:site_visitor) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(site_visitor).to be_valid
    end

    include_examples "attributes present validations", :site_visitor, %i[name country]
  end
end
