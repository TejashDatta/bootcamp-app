require "rails_helper"

RSpec.describe "/normalization", type: :request do
  include_context "uses authorized user with permissions"
  let(:permitted_actions_filter) { "normalization" }

  describe "GET /" do
    it "renders a successful response" do
      get normalization_path
      expect(response).to be_successful
    end
  end
end
