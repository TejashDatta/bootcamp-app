require "rails_helper"

RSpec.describe "/sql_logs", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      get sql_logs_url
      expect(response).to be_successful
    end
  end
end
