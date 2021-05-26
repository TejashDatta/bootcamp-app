require 'rails_helper'

RSpec.describe StockInvestment, type: :model do
  let(:stock_investment) { build(:stock_investment) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(stock_investment).to be_valid
    end

    it "is invalid without stock_name" do
      stock_investment.stock_name = nil
      expect(stock_investment).not_to be_valid
    end

    it "is invalid without shares_owned" do
      stock_investment.shares_owned = nil
      expect(stock_investment).not_to be_valid
    end
  end
end
