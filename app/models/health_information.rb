class HealthInformation < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id
  validates_presence_of :height_in_cm, :weight_in_kg
end
