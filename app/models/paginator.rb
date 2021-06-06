class Paginator
  attr_reader :page, :end_page
  
  def initialize(items, page_param, per_page: 10)
    @items = items
    @page = page_from_param(page_param)
    @per_page = per_page
    @end_page = @page + 9
    @end_page = last_page if @end_page > last_page
  end

  def page_from_param(page_param)
    page_param.nil? ? 1 : page_param.to_i
  end

  def last_page
    @items.count.zero? ? 1 : (@items.count - 1) / @per_page + 1
  end

  def items
    @items.limit(@per_page).offset((@page - 1) * @per_page)
  end
end
