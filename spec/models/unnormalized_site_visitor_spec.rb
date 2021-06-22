require "rails_helper"

RSpec.describe UnnormalizedSiteVisitor, type: :model do
  describe "validations" do
    include_examples "all attributes valid", :unnormalized_site_visitor
    include_examples "attributes present validations", :unnormalized_site_visitor,
                     %i[name country browser browser_developer browser_platforms]
  end
end
