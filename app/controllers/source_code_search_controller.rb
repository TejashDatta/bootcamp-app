class SourceCodeSearchController < ApplicationController
  def show
    @expression = params[:expression]
    @results = SourceCodeSearch.new.search(@expression) if @expression.present?
  end
end
