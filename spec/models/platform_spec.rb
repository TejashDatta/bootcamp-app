require "rails_helper"

RSpec.describe Platform, type: :model do
  let(:platform) { build(:platform) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(platform).to be_valid
    end

    include_examples "attributes present validations", :platform, %i[name]
  end
end
