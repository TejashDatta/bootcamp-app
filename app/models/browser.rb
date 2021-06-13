class Browser < ApplicationRecord
  has_many :site_visitors
  has_many :platforms, through: :browser_compatibilities

  validates_presence_of :name, :developer
end
