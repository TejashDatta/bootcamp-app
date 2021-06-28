class Investor < ApplicationRecord
  has_many :stock_investments, dependent: :destroy
  
  validates_uniqueness_of :account_number
  validates_presence_of :account_number, :balance_in_yen
  validates_numericality_of :balance_in_yen, greater_than_or_equal_to: 0
end
