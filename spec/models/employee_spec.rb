require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { build(:employee) }
  
  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(employee).to be_valid
    end

    it "is invalid without name" do
      employee.name = ""
      expect(employee).not_to be_valid
    end

    it "is invalid without date_of_joining" do
      employee.date_of_joining = ""
      expect(employee).not_to be_valid
    end

    it "is invalid without department" do
      employee.department = ""
      expect(employee).not_to be_valid
    end
  end
end
