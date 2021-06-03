require "rails_helper"

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

  describe "::search" do
    it "returns of list employees that meet where conditions on columns exactly" do
      create(:employee, name: "John", department: "Sales")
      expect(Employee.search({ "name" => "John", "department" => "Sales" }).count).to eq 1
    end
  end

  describe "::searchable_columns" do
    it "returns names of columns exluding automatic id and timestamps" do
      expect(Employee.searchable_columns).to eq(%w[name date_of_joining department])
    end
  end
end
