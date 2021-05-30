require 'rails_helper'

RSpec.describe StockInvestment, type: :model do
  let(:stock_investment) { build(:stock_investment) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(stock_investment).to be_valid
    end

    it "is invalid without investor" do
      stock_investment.investor = nil
      expect(stock_investment).not_to be_valid
    end

    it "is invalid without stock_name" do
      stock_investment.stock_name = ""
      expect(stock_investment).not_to be_valid
    end

    it "is invalid when investor already has same stock" do
      stock_investment.save
      expect(
        build(
          :stock_investment, 
          investor: stock_investment.investor, 
          stock_name: stock_investment.stock_name
        )
      ).not_to be_valid
    end

    it "is invalid without shares_owned" do
      stock_investment.shares_owned = nil
      expect(stock_investment).not_to be_valid
    end

    it "is invalid with negative shares_owned" do
      stock_investment.shares_owned = -1
      expect(stock_investment).not_to be_valid
    end
  end
end
