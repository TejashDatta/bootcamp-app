 require 'rails_helper'

RSpec.describe "/investors/:investor_id/stock_investments", type: :request do
  include_context "uses authorized user with all permissions"

  let(:investor) { create(:investor) }
  let(:stock_investment) { create(:stock_investment) }

  let(:valid_attributes) do
    {
      investor_id: investor.id,
      stock_name: "GOOGL",
      shares_owned: 2.5
    }
  end

  let(:invalid_attributes) do
    {
      investor_id: -1,
      stock_name: "",
      shares_owned: ""
    }
  end

  let(:investor) { create(:investor) }
  let(:stock_investment) { create(:stock_investment) }

  describe "GET /index" do
    it "renders a successful response" do
      get investor_stock_investments_url(stock_investment.investor)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get investor_stock_investment_url(stock_investment.investor, stock_investment)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_investor_stock_investment_url(investor)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_investor_stock_investment_url(stock_investment.investor, stock_investment)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new StockInvestment" do
        expect {
          post investor_stock_investments_url(investor), params: { stock_investment: valid_attributes }
        }.to change(StockInvestment, :count).by(1)
      end

      it "redirects to the created stock_investment" do
        post investor_stock_investments_url(investor), params: { stock_investment: valid_attributes }
        expect(response).to redirect_to(investor_stock_investment_url(StockInvestment.last.investor, StockInvestment.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new StockInvestment" do
        expect {
          post investor_stock_investments_url(investor), params: { stock_investment: invalid_attributes }
        }.to change(StockInvestment, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post investor_stock_investments_url(investor), params: { stock_investment: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { stock_name: "APPL" } }

      it "updates the requested stock_investment" do
        patch investor_stock_investment_url(stock_investment.investor, stock_investment), params: { stock_investment: new_attributes }
        stock_investment.reload
        expect(stock_investment.stock_name).to eq("APPL")
      end

      it "redirects to the stock_investment" do
        patch investor_stock_investment_url(stock_investment.investor, stock_investment), params: { stock_investment: new_attributes }
        stock_investment.reload
        expect(response).to redirect_to(investor_stock_investment_url(stock_investment.investor, stock_investment))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch investor_stock_investment_url(stock_investment.investor, stock_investment), params: { stock_investment: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested stock_investment" do
      stock_investment
      expect {
        delete investor_stock_investment_url(stock_investment.investor, stock_investment)
      }.to change(StockInvestment, :count).by(-1)
    end

    it "redirects to the stock_investments list" do
      delete investor_stock_investment_url(stock_investment.investor, stock_investment)
      expect(response).to redirect_to(investor_stock_investments_url(stock_investment.investor))
    end
  end
end
