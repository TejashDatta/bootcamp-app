require 'rails_helper'

RSpec.describe "/international_travelers", type: :request do
  include_context "uses authorized user with all permissions"
  
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

  let(:international_traveler) { create(:international_traveler) }

  describe "GET /index" do
    it "renders a successful response" do
      international_traveler
      get international_travelers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get international_traveler_url(international_traveler)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_international_traveler_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_international_traveler_url(international_traveler)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new InternationalTraveler" do
        expect {
          post international_travelers_url, params: { international_traveler: valid_attributes }
        }.to change(InternationalTraveler, :count).by(1)
      end

      it "redirects to the created international_traveler" do
        post international_travelers_url, params: { international_traveler: valid_attributes }
        expect(response).to redirect_to(international_traveler_url(InternationalTraveler.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new InternationalTraveler" do
        expect {
          post international_travelers_url, params: { international_traveler: invalid_attributes }
        }.to change(InternationalTraveler, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post international_travelers_url, params: { international_traveler: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { arrival_country: "China" } }

      it "updates the requested international_traveler" do
        patch international_traveler_url(international_traveler), params: { international_traveler: new_attributes }
        international_traveler.reload
        expect(international_traveler.arrival_country).to eq("China")
      end

      it "redirects to the international_traveler" do
        patch international_traveler_url(international_traveler), params: { international_traveler: new_attributes }
        international_traveler.reload
        expect(response).to redirect_to(international_traveler_url(international_traveler))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch international_traveler_url(international_traveler), params: { international_traveler: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested international_traveler" do
      international_traveler
      expect {
        delete international_traveler_url(international_traveler)
      }.to change(InternationalTraveler, :count).by(-1)
    end

    it "redirects to the international_travelers list" do
      delete international_traveler_url(international_traveler)
      expect(response).to redirect_to(international_travelers_url)
    end
  end
end
