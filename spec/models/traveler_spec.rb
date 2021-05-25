require "rails_helper"

RSpec.describe Traveler, type: :model do
  let(:traveler) { build(:traveler) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(traveler).to be_valid
    end

    it "is invalid without name" do
      traveler.name = ""
      expect(traveler).not_to be_valid
    end

    it "is invalid without departure_country" do
      traveler.departure_country = ""
      expect(traveler).not_to be_valid
    end

    it "is invalid without arrival_country" do
      traveler.arrival_country = ""
      expect(traveler).not_to be_valid
    end
  end
end
