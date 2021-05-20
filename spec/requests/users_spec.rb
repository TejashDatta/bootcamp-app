require "rails_helper"

RSpec.describe "/users", type: :request do
  let(:valid_attributes) do
    {
      name: "person",
      email: "email@address.com",
      password: "password"
    }
  end

  let(:invalid_attributes) do
    {
      name: "",
      email: "invalid email address",
      password: ""
    }
  end

  let(:user) { create(:user) }

  describe "GET /index" do
    it "renders a successful response" do
      user
      get users_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get user_url(user)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_user_url(user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_url, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post users_url, params: { user: valid_attributes }
        expect(response).to redirect_to(user_url(User.last))
      end

      it "stores created user id in session" do
        post users_url, params: { user: valid_attributes }
        expect(session[:user_id]).to eq(User.last.id)
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post users_url, params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { name: "new name" } }

      it "updates the requested user" do
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(user.name).to eq("new name")
      end

      it "redirects to the user" do
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      created_user = user
      expect { delete user_url(created_user) }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete user_url(user)
      expect(response).to redirect_to(users_url)
    end
  end
end
