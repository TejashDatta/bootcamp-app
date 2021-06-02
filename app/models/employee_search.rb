class EmployeeSearch
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :department, :string
  attribute :date_of_joining_lower_limit, :string
  attribute :date_of_joining_upper_limit, :string

  def search
    employees = Employee.all
    attributes.each do |key, value|
      employees = employees.send("filter_by_#{key}", value) if value.present?
    end
    employees
  end
end
