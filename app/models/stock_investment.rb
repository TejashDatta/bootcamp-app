class StockInvestment < ApplicationRecord
  belongs_to :investor

  validates_presence_of :investor, :stock_name, :shares_owned
  validates_numericality_of :shares_owned, greater_than_or_equal_to: 0
end
