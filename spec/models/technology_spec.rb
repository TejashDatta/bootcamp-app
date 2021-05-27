require 'rails_helper'

RSpec.describe Technology, type: :model do
  let(:technology) { build(:technology) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(technology).to be_valid
    end

    it "is invalid without name" do
      technology.name = nil
      expect(technology).not_to be_valid
    end
  end
end
