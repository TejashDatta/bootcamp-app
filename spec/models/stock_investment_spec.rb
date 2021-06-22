require "rails_helper"

RSpec.describe StockInvestment, type: :model do
  let(:stock_investment) { build(:stock_investment) }

  describe "validations" do
    include_examples "all attributes valid", :stock_investment
    include_examples "attributes present validations", :stock_investment,
                     %i[investor stock_name shares_owned]

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

    it "is invalid with negative shares_owned" do
      stock_investment.shares_owned = -1
      expect(stock_investment).not_to be_valid
    end
  end
end
