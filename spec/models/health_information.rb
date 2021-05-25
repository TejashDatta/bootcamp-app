require "rails_helper"

RSpec.describe HealthInformation, type: :model do
  let(:health_information) { build(:health_information) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(health_information).to be_valid
    end

    context "user validations" do
      it "is invalid without user" do
        health_information.user = nil
        expect(health_information).not_to be_valid
      end

      it "is invalid when user already has health information" do
        health_information.save
        expect(build(:health_information, user: health_information.user)).not_to be_valid
      end
    end

    it "is invalid without height_in_cm" do
      health_information.height_in_cm = nil
      expect(health_information).not_to be_valid
    end

    it "is invalid without weight_in_kg" do
      health_information.weight_in_kg = nil
      expect(health_information).not_to be_valid
    end
  end
end
