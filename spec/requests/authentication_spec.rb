require "rails_helper"

RSpec.describe "Authentication", type: :request do
  describe "GET /login" do
    it "renders a successful response" do
      get login_path
      expect(response).to be_successful
    end
  end

  describe "POST /login" do
    let(:user) { create(:user) }

    context "when login is valid" do
      let(:post_params) { { email: user.email, password: user.password } }

      it "sets user id in session" do
        post "/login", params: post_params
        expect(session[:user_id]).to eq(user.id)
      end

      it "redirects to the logged in user" do
        post "/login", params: post_params
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "when login is invalid" do
      context "when password is wrong" do
        it "renders a successful response (i.e. to display the 'new' login template)" do
          post "/login", params: { email: user.email, password: "wrong password" }
          expect(response).to be_successful
        end
      end

      context "when user with email doesn't exist" do
        it "renders a successful response (i.e. to display the 'new' login template)" do
          post "/login", params: { email: "non-existing@user.com", password: "wrong password" }
          expect(response).to be_successful
        end
      end
    end
  end

  describe "DELETE /logout" do
    include_context "uses authorized user"

    it "unsets user id in session" do
      delete logout_path
      expect(session[:user_id]).to be_nil
    end

    it "redirects to login page" do
      delete logout_path
      expect(response).to redirect_to(login_path)
    end
  end
end
