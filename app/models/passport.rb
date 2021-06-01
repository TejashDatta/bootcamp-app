class Passport < ApplicationRecord
  belongs_to :traveler

  validates_uniqueness_of :traveler_id
  validates_presence_of :passport_number, :nationality
end
