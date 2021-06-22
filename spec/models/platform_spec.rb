require "rails_helper"

RSpec.describe Platform, type: :model do
  describe "validations" do
    include_examples "all attributes valid", :platform
    include_examples "attributes present validations", :platform, %i[name]
  end
end
