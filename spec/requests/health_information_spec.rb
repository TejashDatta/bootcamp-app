 require 'rails_helper'

RSpec.describe "/health_information", type: :request do
  include_context "uses authorized user with all permissions"

  let(:valid_attributes) do
    {
      user_id: create(:user).id,
      height_in_cm: 150.5,
      weight_in_kg: 60.5
    }
  end

  let(:invalid_attributes) do
    {
      user_id: -1,
      height_in_cm: "",
      weight_in_kg: ""
    }
  end

  let(:health_information) { create(:health_information) }

  describe "GET /index" do
    it "renders a successful response" do
      health_information
      get health_information_index_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get health_information_url(health_information)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_health_information_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_health_information_url(health_information)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new HealthInformation" do
        expect {
          post health_information_index_url, params: { health_information: valid_attributes }
        }.to change(HealthInformation, :count).by(1)
      end

      it "redirects to the created health_information" do
        post health_information_index_url, params: { health_information: valid_attributes }
        expect(response).to redirect_to(health_information_url(HealthInformation.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new HealthInformation" do
        expect {
          post health_information_index_url, params: { health_information: invalid_attributes }
        }.to change(HealthInformation, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post health_information_index_url, params: { health_information: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { height_in_cm: 151.5 } }

      it "updates the requested health_information" do
        patch health_information_url(health_information), params: { health_information: new_attributes }
        health_information.reload
        expect(health_information.height_in_cm).to eq(151.5)
      end

      it "redirects to the health_information" do
        patch health_information_url(health_information), params: { health_information: new_attributes }
        health_information.reload
        expect(response).to redirect_to(health_information_url(health_information))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch health_information_url(health_information), params: { health_information: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested health_information" do
      health_information
      expect {
        delete health_information_url(health_information)
      }.to change(HealthInformation, :count).by(-1)
    end

    it "redirects to the health_information list" do
      delete health_information_url(health_information)
      expect(response).to redirect_to(health_information_index_url)
    end
  end
end
