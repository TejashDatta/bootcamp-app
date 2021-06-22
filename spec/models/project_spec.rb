require "rails_helper"

RSpec.describe Project, type: :model do
  let(:project) { build(:project) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(project).to be_valid
    end

    include_examples "attributes present validations", :project, %i[name]
  end
end
