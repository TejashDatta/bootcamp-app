class Traveler < ApplicationRecord
  has_one :passport, dependent: :destroy
  belongs_to :account_user, class_name: "User", foreign_key: "user_id"

  validates_presence_of :name, :departure_country, :arrival_country
end
