class BrowserCompatibility < ApplicationRecord
  belongs_to :browser
  belongs_to :platform

  validates_presence_of :browser, :platform
end
