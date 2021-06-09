require 'rails_helper'

RSpec.describe "/citizens", type: :request do
  include_context "uses authorized user with permissions"
  let(:permitted_actions_filter) { "citizens" }

  let(:valid_attributes) do
    {
      name: "Tejash",
      city: "Kolkata"
    }
  end

  let(:invalid_attributes) do
    {
      name: "",
      city: ""
    }
  end

  let(:citizen) { create(:citizen) }

  describe "GET /index" do
    it "renders a successful response" do
      citizen
      get citizens_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get citizen_url(citizen)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_citizen_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_citizen_url(citizen)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Citizen" do
        expect {
          post citizens_url, params: { citizen: valid_attributes }
        }.to change(Citizen, :count).by(1)
      end

      it "redirects to the created citizen" do
        post citizens_url, params: { citizen: valid_attributes }
        expect(response).to redirect_to(citizen_url(Citizen.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Citizen" do
        expect {
          post citizens_url, params: { citizen: invalid_attributes }
        }.to change(Citizen, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post citizens_url, params: { citizen: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { city: "Mumbai" } }

      it "updates the requested citizen" do
        patch citizen_url(citizen), params: { citizen: new_attributes }
        citizen.reload
        expect(citizen.city).to eq "Mumbai"
      end

      it "redirects to the citizen" do
        patch citizen_url(citizen), params: { citizen: new_attributes }
        citizen.reload
        expect(response).to redirect_to(citizen_url(citizen))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch citizen_url(citizen), params: { citizen: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested citizen" do
      citizen
      expect {
        delete citizen_url(citizen)
      }.to change(Citizen, :count).by(-1)
    end

    it "redirects to the citizens list" do
      delete citizen_url(citizen)
      expect(response).to redirect_to(citizens_url)
    end
  end
end
