 require 'rails_helper'

RSpec.describe "/users/:user_id/permissions", type: :request do
  include_context "uses authorized user with permissions"
<<<<<<< HEAD
  let(:permitted_actions_filter) { "permissions" }
=======
  let(:permitted_actions_filter) { /permissions/ }
>>>>>>> bdac26f7cdad409b2c738972522be054b04c8385

  let(:user) { create(:user) }

  describe "GET /" do
    it "renders a successful response" do
      get user_permissions_url(user)
      expect(response).to be_successful
    end
  end

  describe "PATCH /" do
    context "with array of actions as parameter" do
      it "sets users permissions to actions given in array" do
        patch user_permissions_url(user), params: { actions: ["users#index"] }
        expect(user.permissions.size).to eq(1)
        expect(user.permissions.first.action).to eq("users#index")
      end
    end
  end
end
