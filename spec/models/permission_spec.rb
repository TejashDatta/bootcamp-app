require 'rails_helper'

RSpec.describe Permission, type: :model do
  let(:permission) { build(:permission) }

  it "is valid when all attributes are valid" do
    expect(permission).to be_valid
  end

  it "is invalid without action name" do
    permission.action = ""
    expect(permission).not_to be_valid
  end

  it "is invalid if user already has the permission" do
    permission.save
    expect(build(:permission, user: permission.user, action: permission.action)).not_to be_valid
  end
end
