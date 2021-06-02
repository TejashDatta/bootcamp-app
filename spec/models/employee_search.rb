require "rails_helper"

RSpec.describe EmployeeSearch, type: :model do
  describe "#search" do
    it "searches records that meet all conditions" do
      create(:employee, name: "John Smith", department: "Sales", date_of_joining: "2020-05-01")
      expect(
        EmployeeSearch
          .new(
            name: "john",
            department: "sales",
            date_of_joining_lower_limit: "2020-04-01",
            date_of_joining_upper_limit: "2020-06-01"
          )
          .search
          .count
      ).to eq(1)
    end
  end
end
