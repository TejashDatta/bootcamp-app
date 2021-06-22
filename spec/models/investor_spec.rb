require "rails_helper"

RSpec.describe Investor, type: :model do
  let(:investor) { build(:investor) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(investor).to be_valid
    end

    include_examples "attributes present validations", :investor, %i[account_number]

    it "is invalid with negative balance_in_yen" do
      investor.balance_in_yen = -1
      expect(investor).not_to be_valid
    end
  end
end
