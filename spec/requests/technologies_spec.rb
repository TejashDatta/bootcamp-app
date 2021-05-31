 require 'rails_helper'

RSpec.describe "/technologies", type: :request do
  include_context "uses authorized user with permissions"
  let(:permitted_actions_filter) { /technologies/ }

  let(:technology) { create(:technology) }
  
  let(:valid_attributes) do
    {
      name: "Ruby"
    }
  end

  let(:invalid_attributes) do
    {
      name: ""
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      technology
      get technologies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get technology_url(technology)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_technology_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_technology_url(technology)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Technology" do
        expect {
          post technologies_url, params: { technology: valid_attributes }
        }.to change(Technology, :count).by(1)
      end

      it "redirects to the created technology" do
        post technologies_url, params: { technology: valid_attributes }
        expect(response).to redirect_to(technology_url(Technology.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Technology" do
        expect {
          post technologies_url, params: { technology: invalid_attributes }
        }.to change(Technology, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post technologies_url, params: { technology: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { name: "python" } }

      it "updates the requested technology" do
        patch technology_url(technology), params: { technology: new_attributes }
        technology.reload
        expect(technology.name).to eq("python")
      end

      it "redirects to the technology" do
        patch technology_url(technology), params: { technology: new_attributes }
        technology.reload
        expect(response).to redirect_to(technology_url(technology))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch technology_url(technology), params: { technology: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested technology" do
      technology
      expect {
        delete technology_url(technology)
      }.to change(Technology, :count).by(-1)
    end

    it "redirects to the technologies list" do
      delete technology_url(technology)
      expect(response).to redirect_to(technologies_url)
    end
  end
end
