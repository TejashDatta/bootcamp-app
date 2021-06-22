require "rails_helper"

RSpec.describe SiteVisitor, type: :model do
  describe "validations" do
    include_examples "all attributes valid", :site_visitor
    include_examples "attributes present validations", :site_visitor, %i[name country]
  end
end
