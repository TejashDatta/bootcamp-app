class SiteVisitor < ApplicationRecord
  belongs_to :browser

  validates_presence_of :name, :country
end
