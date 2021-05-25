class InternationalTraveler < ApplicationRecord
  validates_presence_of :name, :departure_country, :arrival_country
end
