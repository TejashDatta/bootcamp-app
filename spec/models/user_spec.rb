require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(user).to be_valid
    end

    context "name validations" do
      it "is invalid when name is empty" do
        user.name = ""
        expect(user).not_to be_valid
      end

      it "is invalid when name is longer than 15 characters" do
        user.name = "a" * 16
        expect(user).not_to be_valid
      end
    end

    context "email validations" do
      it "is invalid when email is empty" do
        user.email = ""
        expect(user).not_to be_valid
      end

      it "is invalid when email is improper format" do
        user.email = "invalid-email.com"
        expect(user).not_to be_valid
      end

      it "is invalid when email is not unique" do
      end
    end
  end
end
