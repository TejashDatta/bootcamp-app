class Employee < ApplicationRecord
  validates_presence_of :name, :date_of_joining, :department

  scope :filter_by_name, ->(name) { where("name like ?", "#{name}%") }
  scope :filter_by_department, ->(department) { where department: department }
  # scope :filter_by_date_of_joining, ->(location_id) { where location_id: location_id }
end
