require 'rails_helper'

RSpec.describe Citizen, type: :model do
  let(:citizen) { build(:citizen) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(citizen).to be_valid
    end

    include_examples "attributes present validations", :citizen, %i[name city]
  end
end
