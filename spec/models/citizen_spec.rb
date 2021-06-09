require 'rails_helper'

RSpec.describe Citizen, type: :model do
  let(:citizen) { build(:citizen) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(citizen).to be_valid
    end

    it "is invalid without name" do
      citizen.name = ""
      expect(citizen).not_to be_valid
    end

    it "is invalid without city" do
      citizen.city = ""
      expect(citizen).not_to be_valid
    end
  end
end
