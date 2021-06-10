require 'rails_helper'

RSpec.describe "/users/:user_id/permissions", type: :request do
  include_context "uses authorized user with permissions"
  let(:permitted_actions_filter) { "permissions" }

  describe "GET /" do
    it "renders a successful response" do
      get user_permissions_url(authorized_user)
      expect(response).to be_successful
    end
  end

  describe "PATCH /" do
    context "with array of actions as parameter" do
      it "sets users permissions to actions given in array" do
        patch user_permissions_url(authorized_user), params: { actions: ["users#index"] }
        expect(authorized_user.permissions.size).to eq(1)
        expect(authorized_user.permissions.first.action).to eq("users#index")
      end
    end
  end
end
