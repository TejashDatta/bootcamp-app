require 'rails_helper'

RSpec.describe Permission, type: :model do
  let(:permission) { build(:permission) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(permission).to be_valid
    end

    include_examples "attributes present validations", :permission, %i[action]

    it "is invalid if action not in application" do
      permission.action = "invalid action"
      expect(permission).not_to be_valid
    end

    it "is invalid if user already has the permission" do
      permission.save
      expect(build(:permission, user: permission.user, action: permission.action)).not_to be_valid
    end
  end

  describe "::all_permissions" do
    it "returns names of actions in application" do
      all_actions = Permission.all_actions
      expect(all_actions).to be_an_instance_of(Array)
      expect(all_actions).to all(match(/\w+#\w+/))
    end
  end
end
