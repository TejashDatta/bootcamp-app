 require 'rails_helper'

RSpec.describe "/investors", type: :request do
  include_context "uses authorized user with permissions"
<<<<<<< HEAD
  let(:permitted_actions_filter) { "investors" }
=======
  let(:permitted_actions_filter) { /investors/ }
>>>>>>> bdac26f7cdad409b2c738972522be054b04c8385
  
  let(:valid_attributes) do
    {
      account_number: "AC001",
      balance_in_yen: 1500
    }
  end

  let(:invalid_attributes) do
    {
      account_number: "",
      balance_in_yen: ""
    }
  end

  let(:investor) { create(:investor) }

  describe "GET /index" do
    it "renders a successful response" do
      investor
      get investors_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get investor_url(investor)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_investor_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_investor_url(investor)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Investor" do
        expect {
          post investors_url, params: { investor: valid_attributes }
        }.to change(Investor, :count).by(1)
      end

      it "redirects to the created investor" do
        post investors_url, params: { investor: valid_attributes }
        expect(response).to redirect_to(investor_url(Investor.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Investor" do
        expect {
          post investors_url, params: { investor: invalid_attributes }
        }.to change(Investor, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post investors_url, params: { investor: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { balance_in_yen: 20 } }

      it "updates the requested investor" do
        patch investor_url(investor), params: { investor: new_attributes }
        investor.reload
        expect(investor.balance_in_yen).to eq(20)
      end

      it "redirects to the investor" do
        patch investor_url(investor), params: { investor: new_attributes }
        investor.reload
        expect(response).to redirect_to(investor_url(investor))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch investor_url(investor), params: { investor: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested investor" do
      investor
      expect {
        delete investor_url(investor)
      }.to change(Investor, :count).by(-1)
    end

    it "redirects to the investors list" do
      delete investor_url(investor)
      expect(response).to redirect_to(investors_url)
    end
  end
end
