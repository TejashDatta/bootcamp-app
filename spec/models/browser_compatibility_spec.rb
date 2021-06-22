require "rails_helper"

RSpec.describe BrowserCompatibility, type: :model do
  describe "validations" do
    include_examples "all attributes valid", :browser_compatibility
    include_examples "attributes present validations", :browser_compatibility, %i[browser platform]
  end
end
