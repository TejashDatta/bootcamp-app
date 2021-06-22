require 'rails_helper'

RSpec.describe Citizen, type: :model do
  describe "validations" do
    include_examples "all attributes valid", :citizen
    include_examples "attributes present validations", :citizen, %i[name city]
  end
end
