class Traveler < ApplicationRecord
  has_one :passport, dependent: :destroy

  validates_presence_of :name, :departure_country, :arrival_country
end
