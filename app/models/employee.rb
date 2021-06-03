class Employee < ApplicationRecord
  include Searchable
  
  validates_presence_of :name, :date_of_joining, :department
end
