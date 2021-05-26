class Investor < ApplicationRecord
  validates_uniqueness_of :account_number
  validates_presence_of :account_number, :balance_in_yen
end
