module Searchable
  extend ActiveSupport::Concern

  class_methods do
    def search(params)
      results = all
      params.each do |key, value|
        results = results.where("#{key} = ?", value) if value.present?
      end
      results
    end

    def searchable_columns
      column_names - %w[id created_at updated_at]
    end
  end
end
