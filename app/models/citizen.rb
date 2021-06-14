class Citizen < ApplicationRecord
  include Searchable
  
  validates_presence_of :name, :city
end
