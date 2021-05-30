class Paginator
  PER_PAGE = 10

  attr_reader :page
  
  def initialize(model, page_param)
    @model = model
    @page = page_param.nil? ? 1 : page_param.to_i
    @per_page = PER_PAGE
  end

  def last_page
    @model.count.zero? ? 1 : (@model.count - 1) / @per_page + 1
  end

  def items
    @model.all.limit(@per_page).offset((@page - 1) * @per_page)
  end
end
