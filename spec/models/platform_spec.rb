require "rails_helper"

RSpec.describe Platform, type: :model do
  let(:platform) { build(:platform) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(platform).to be_valid
    end

    it "is invalid without name" do
      platform.name = ""
      expect(platform).not_to be_valid
    end
  end
end
