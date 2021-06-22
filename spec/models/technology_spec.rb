require 'rails_helper'

RSpec.describe Technology, type: :model do
  let(:technology) { build(:technology) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(technology).to be_valid
    end

    include_examples "attributes present validations", :technology, %i[name]
  end
end
