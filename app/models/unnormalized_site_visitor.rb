class UnnormalizedSiteVisitor < ApplicationRecord
  validates_presence_of :name, :country, :browser, :browser_developer, :browser_platforms
end
