class StockInvestment < ApplicationRecord
  belongs_to :investor

  validates_presence_of :stock_name, :shares_owned
end
