require "rails_helper"

RSpec.describe Traveler, type: :model do
  let(:traveler) { build(:traveler) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(traveler).to be_valid
    end

    include_examples "attributes present validations", :traveler,
                     %i[name departure_country arrival_country]
  end
end
