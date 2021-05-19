require "rails_helper"

RSpec.describe "/all_logs", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      get all_logs_url
      expect(response).to be_successful
    end
  end
end
