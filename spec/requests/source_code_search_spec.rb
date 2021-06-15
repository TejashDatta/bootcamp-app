require "rails_helper"

RSpec.describe "/source_code_search", type: :request do
  include_context "uses authorized user with permissions"
  let(:permitted_actions_filter) { "source_code_search" }

  describe "GET /show" do
    it "renders a successful response" do
      get source_code_search_path, params: { expression: "show" }
      expect(response).to be_successful
    end
  end
end
