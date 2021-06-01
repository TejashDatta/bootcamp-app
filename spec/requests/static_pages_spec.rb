require "rails_helper"

RSpec.describe "StaticPages", type: :request do
  include_context "uses authorized user with permissions"
<<<<<<< HEAD
  let(:permitted_actions_filter) { "static_pages" }
=======
  let(:permitted_actions_filter) { /static_pages/ }
>>>>>>> bdac26f7cdad409b2c738972522be054b04c8385

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
