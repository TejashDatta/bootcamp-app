require "rails_helper"

RSpec.describe Passport, type: :model do
  let(:passport) { build(:passport) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(passport).to be_valid
    end

    context "traveler validations" do
      it "is invalid without traveler" do
        passport.traveler = nil
        expect(passport).not_to be_valid
      end

      it "is invalid when traveler already has passport" do
        passport.save
        expect(build(:passport, traveler: passport.traveler)).not_to be_valid
      end
    end

    it "is invalid without passport_number" do
      passport.passport_number = nil
      expect(passport).not_to be_valid
    end

    it "is invalid without nationality" do
      passport.nationality = nil
      expect(passport).not_to be_valid
    end
  end
end
