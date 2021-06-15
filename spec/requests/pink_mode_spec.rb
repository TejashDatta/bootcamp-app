require "rails_helper"

RSpec.describe "/pink_mode", type: :request do
  include_context "uses authorized user with permissions"
  let(:permitted_actions_filter) { "pink_mode" }

  describe "POST /toggle" do
    it "redirects back or to root" do
      post toggle_pink_mode_path
      expect(response).to redirect_to root_path
    end

    it "sets pink_mode session variable to true when not set" do
      post toggle_pink_mode_path
      expect(session[:pink_mode]).to be true
    end

    it "toggles pink_mode session variable" do
      post toggle_pink_mode_path
      post toggle_pink_mode_path
      expect(session[:pink_mode]).to be false
    end
  end
end
