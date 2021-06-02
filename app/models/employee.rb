class Employee < ApplicationRecord
  validates_presence_of :name, :date_of_joining, :department

  scope :filter_by_name, ->(name) { where("lower(name) LIKE ?", "%#{name.downcase}%") }
  scope :filter_by_department, ->(department) { where("lower(department) LIKE ?", department.downcase) }
  scope :filter_by_date_of_joining_lower_limit, ->(lower_limit) { where("date_of_joining > ?", lower_limit) }
  scope :filter_by_date_of_joining_upper_limit, ->(upper_limit) { where("date_of_joining < ?", upper_limit) }
end
