class Employee < ApplicationRecord
  include Searchable

  validates_presence_of :name, :date_of_joining, :department

  def self.validate_search_params(params)
    errors = {}
    if params[:date_of_joining].present? && params[:date_of_joining] !~ /\d{4}-\d{2}-\d{2}/
      errors[:date_of_joining] = ["日付の形式は不正 yyyy-mm-dd"]
    end
    errors
  end
end
