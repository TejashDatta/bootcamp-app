class Investor < ApplicationRecord
  has_many :stock_investments, dependent: :destroy
  belongs_to :account_user, class_name: "User", foreign_key: "user_id"
  
  validates_uniqueness_of :account_number
  validates_presence_of :account_number, :balance_in_yen
  validates_numericality_of :balance_in_yen, greater_than_or_equal_to: 0
end
