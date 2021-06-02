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

  describe "scopes" do
    describe "filter_by_name" do
      it "selects records with name like" do
        create(:employee, name: "Steve")
        create(:employee, name: "John Smith")
        expect(Employee.filter_by_name("john").count).to eq(1)
      end
    end

    describe "filter_by_department" do
      it "selects records with department equal to (case insensitive)" do
        create(:employee, department: "Marketing")
        create(:employee, department: "Sales")
        expect(Employee.filter_by_department("sales").count).to eq(1)
      end
    end

    context "date_of_joining scopes" do
      before do
        create(:employee, date_of_joining: "2020-04-20")
        create(:employee, date_of_joining: "2020-06-20")
      end

      describe "filter_by_date_of_joining_lower_limit" do
        it "selects records with date_of_joining after given date" do
          expect(Employee.filter_by_date_of_joining_lower_limit("2020-05-20").count).to eq(1)
        end
      end

      describe "filter_by_date_of_joining_upper_limit" do
        it "selects records with date_of_joining before given date" do
          expect(Employee.filter_by_date_of_joining_upper_limit("2020-05-20").count).to eq(1)
        end
      end
    end
  end
end
