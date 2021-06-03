require "rails_helper"

RSpec.describe Project, type: :model do
  let(:project) { build(:project) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(project).to be_valid
    end

    it "is invalid without name" do
      project.name = ""
      expect(project).not_to be_valid
    end
  end
end
