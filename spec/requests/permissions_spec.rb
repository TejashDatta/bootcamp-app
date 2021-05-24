 require 'rails_helper'

RSpec.describe "Permissions", type: :request do
  include_context "uses authorized user with all permissions"

  let(:valid_attributes) { { action: "user#create" } }

  let(:invalid_attributes) { { action: "" } }

  let(:permission) { create(:permission) }
  let(:user) { create(:user) }

  describe "GET /users/:user_id/permissions" do
    it "renders a successful response" do
      get user_permissions_url(permission.user)
      expect(response).to be_successful
    end
  end

  describe "GET /users/:user_id/permissions/new" do
    it "renders a successful response" do
      get new_user_permission_url(user)
      expect(response).to be_successful
    end
  end

  describe "POST /users/:user_id/permissions/new" do
    context "with valid parameters" do
      it "creates a new Permission" do
        expect {
          post user_permissions_url(user), params: { permission: valid_attributes }
        }.to change(Permission, :count).by(1)
      end

      it "redirects to user permissions" do
        post user_permissions_url(user), params: { permission: valid_attributes }
        expect(response).to redirect_to(user_permissions_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Permission" do
        expect {
          post user_permissions_url(user), params: { permission: invalid_attributes }
        }.to change(Permission, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post user_permissions_url(user), params: { permission: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested permission" do
      permission
      expect {
        delete user_permission_url(permission.user, permission)
      }.to change(Permission, :count).by(-1)
    end

    it "redirects to the user permissions list" do
      delete user_permission_url(permission.user, permission)
      expect(response).to redirect_to(user_permissions_url(permission.user))
    end
  end
end
