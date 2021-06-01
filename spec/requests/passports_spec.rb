 require 'rails_helper'

RSpec.describe "/travelers/:traveler_id/passport", type: :request do
  include_context "uses authorized user with permissions"
<<<<<<< HEAD
  let(:permitted_actions_filter) { "passports" }
=======
  let(:permitted_actions_filter) { /passports/ }
>>>>>>> bdac26f7cdad409b2c738972522be054b04c8385

  let(:valid_attributes) do
    {
      passport_number: "PA0101",
      nationality: "Japan"
    }
  end

  let(:invalid_attributes) do
    {
      passport_number: "",
      nationality: ""
    }
  end

  let(:traveler) { create(:traveler) }
  let(:passport) { create(:passport) }

  describe "GET /" do
    it "renders a successful response" do
      get traveler_passport_url(passport.traveler)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_traveler_passport_url(traveler)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get traveler_passport_url(passport.traveler)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Passport" do
        expect {
          post traveler_passport_url(traveler), params: { passport: valid_attributes }
        }.to change(Passport, :count).by(1)
      end

      it "redirects to the created passport" do
        post traveler_passport_url(traveler), params: { passport: valid_attributes }
        expect(response).to redirect_to(traveler_passport_url(traveler))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Passport" do
        expect {
          post traveler_passport_url(traveler), params: { passport: invalid_attributes }
        }.to change(Passport, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post traveler_passport_url(traveler), params: { passport: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { passport_number: "PA1300" } }

      it "updates the requested passport" do
        patch traveler_passport_url(passport.traveler), params: { passport: new_attributes }
        passport.reload
        expect(passport.passport_number).to eq("PA1300")
      end

      it "redirects to the passport" do
        patch traveler_passport_url(passport.traveler), params: { passport: new_attributes }
        passport.reload
        expect(response).to redirect_to(traveler_passport_url(passport.traveler))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch traveler_passport_url(passport.traveler), params: { passport: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested passport" do
      passport
      expect {
        delete traveler_passport_url(passport.traveler)
      }.to change(Passport, :count).by(-1)
    end

    it "redirects to the travelers list" do
      delete traveler_passport_url(passport.traveler)
      expect(response).to redirect_to(travelers_url)
    end
  end
end
