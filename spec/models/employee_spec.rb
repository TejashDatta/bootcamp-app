require "rails_helper"

RSpec.describe Employee, type: :model do
  describe "validations" do
    include_examples "all attributes valid", :employee
    include_examples "attributes present validations", :employee, %i[name date_of_joining department]
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

  describe "::validate_search_params" do
    it "validates that date_of_joining is in proper format" do
      expect(
        Employee.validate_search_params({ date_of_joining: "12 Jan 2021" })[:date_of_joining].length
      ).to eq 1
    end
  end
end
