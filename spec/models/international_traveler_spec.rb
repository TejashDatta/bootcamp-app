require "rails_helper"

RSpec.describe InternationalTraveler, type: :model do
  let(:international_traveler) { build(:international_traveler) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(international_traveler).to be_valid
    end

    it "is invalid without name" do
      international_traveler.name = ""
      expect(international_traveler).not_to be_valid
    end

    it "is invalid without departure_country" do
      international_traveler.departure_country = ""
      expect(international_traveler).not_to be_valid
    end

    it "is invalid without arrival_country" do
      international_traveler.arrival_country = ""
      expect(international_traveler).not_to be_valid
    end
  end
end
