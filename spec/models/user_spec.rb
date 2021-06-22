require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(user).to be_valid
    end

    include_examples "attributes present validations", :user, %i[name email password]

    it "is invalid when name is longer than 15 characters" do
      user.name = "a" * 16
      expect(user).not_to be_valid
    end

    context "email validations" do
      it "is invalid when email is improper format" do
        user.email = "invalid-email.com"
        expect(user).not_to be_valid
      end

      it "is invalid when email is not unique" do
        create(:user, email: user.email)
        expect(user).not_to be_valid
      end
    end
  end

  describe "permission association" do
    describe "#permission?" do
      it "returns permission of action for user" do
        user.save
        permission = create(:permission, user: user)
        expect(user.permission?(permission.action)).to be_truthy
      end
    end

    describe "#permit_actions" do
      it "sets permitted actions of user to actions in array" do
        user.save
        create(:permission, user: user, action: "users#edit")
        user.permit_actions(["users#new", "users#create"])
        expect(user.permissions.find_by(action: "users#edit")).to be_falsy
        expect(user.permissions.find_by(action: "users#new")).to be_truthy
        expect(user.permissions.find_by(action: "users#create")).to be_truthy
      end
    end
  end

  describe "#sent_and_received_messages" do
    it "collects all messages the user is involved in" do
      create(:message, sender: user)
      create(:message, receiver: user)
      expect(user.sent_and_received_messages.size).to eq 2
    end
  end
end
