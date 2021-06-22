require "rails_helper"

RSpec.describe UnnormalizedSiteVisitor, type: :model do
  let(:unnormalized_site_visitor) { build(:unnormalized_site_visitor) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(unnormalized_site_visitor).to be_valid
    end

    include_examples "attributes present validations", :unnormalized_site_visitor,
                     %i[name country browser browser_developer browser_platforms]
  end
end
