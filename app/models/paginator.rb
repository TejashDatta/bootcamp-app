class Paginator
  attr_reader :page
  
  def initialize(model, page_param, per_page: 10)
    @model = model
    @page = page_from_param(page_param)
    @per_page = per_page
  end

  def page_from_param(page_param)
    page_param.nil? ? 1 : page_param.to_i
  end

  def last_page
    @model.count.zero? ? 1 : (@model.count - 1) / @per_page + 1
  end

  def items
    @model.all.limit(@per_page).offset((@page - 1) * @per_page)
  end
end
