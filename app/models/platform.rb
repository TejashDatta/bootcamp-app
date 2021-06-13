class Platform < ApplicationRecord
  has_and_belongs_to_many :browsers, through: :browser_compatibilities

  validates_presence_of :name
end
