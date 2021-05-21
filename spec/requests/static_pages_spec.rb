require "rails_helper"

RSpec.describe "static_pages", type: :request do
  describe "GET / => #home" do
    it "renders a successful response" do
      get "/"
      expect(response).to be_successful
    end
  end

  describe "GET /log" do
    it "renders a successful response" do
      get "/log"
      expect(response).to be_successful
    end
  end

  describe "GET /sql" do
    it "renders a successful response" do
      get "/sql"
      expect(response).to be_successful
    end
  end
end
