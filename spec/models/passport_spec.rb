require "rails_helper"

RSpec.describe Passport, type: :model do
  let(:passport) { build(:passport) }

  describe "validations" do
    include_examples "all attributes valid", :passport
    include_examples "attributes present validations", :passport,
                     %i[traveler passport_number nationality]

    it "is invalid when traveler already has passport" do
      passport.save
      expect(build(:passport, traveler: passport.traveler)).not_to be_valid
    end
  end
end
