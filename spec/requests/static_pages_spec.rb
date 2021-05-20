require "rails_helper"

RSpec.describe "/static_pages", type: :request do
  describe "GET /log" do
    it "renders a successful response" do
      get "/static_pages/log"
      expect(response).to be_successful
    end
  end

  describe "GET /sql" do
    it "renders a successful response" do
      get "/static_pages/sql"
      expect(response).to be_successful
    end
  end
end
