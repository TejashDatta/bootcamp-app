class Paginator
  PER_PAGE = 10

  attr_reader :page
  
  def initialize(model, page_param)
    @model = model
    @page = page_param.nil? ? 1 : page_param.to_i
  end

  def last_page
    @model.count.zero? ? 1 : (@model.count - 1) / PER_PAGE + 1
  end

  def items
    @model.all.limit(PER_PAGE).offset((@page - 1) * PER_PAGE)
  end
end
