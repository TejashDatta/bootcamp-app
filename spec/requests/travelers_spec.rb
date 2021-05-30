require 'rails_helper'

RSpec.describe "/travelers", type: :request do
  include_context "uses authorized user with controller permissions"
  let(:controller) { TravelersController }
  
  let(:valid_attributes) do
    {
      name: "John",
      departure_country: "Portugal",
      arrival_country: "Japan"
    }
  end

  let(:invalid_attributes) do
    {
      name: "",
      departure_country: "",
      arrival_country: ""
    }
  end

  let(:traveler) { create(:traveler) }

  describe "GET /index" do
    it "renders a successful response" do
      traveler
      get travelers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get traveler_url(traveler)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_traveler_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_traveler_url(traveler)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Traveler" do
        expect {
          post travelers_url, params: { traveler: valid_attributes }
        }.to change(Traveler, :count).by(1)
      end

      it "redirects to the created traveler" do
        post travelers_url, params: { traveler: valid_attributes }
        expect(response).to redirect_to(traveler_url(Traveler.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Traveler" do
        expect {
          post travelers_url, params: { traveler: invalid_attributes }
        }.to change(Traveler, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post travelers_url, params: { traveler: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { arrival_country: "China" } }

      it "updates the requested traveler" do
        patch traveler_url(traveler), params: { traveler: new_attributes }
        traveler.reload
        expect(traveler.arrival_country).to eq("China")
      end

      it "redirects to the traveler" do
        patch traveler_url(traveler), params: { traveler: new_attributes }
        traveler.reload
        expect(response).to redirect_to(traveler_url(traveler))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch traveler_url(traveler), params: { traveler: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested traveler" do
      traveler
      expect {
        delete traveler_url(traveler)
      }.to change(Traveler, :count).by(-1)
    end

    it "redirects to the travelers list" do
      delete traveler_url(traveler)
      expect(response).to redirect_to(travelers_url)
    end
  end
end
