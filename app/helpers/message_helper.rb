module MessageHelper
  def format_message_datetime_compact(datetime)
    if datetime.to_date == Time.current.to_date
      datetime.strftime("%l:%M %p")
    elsif datetime.year == Time.current.year
      datetime.strftime("%b %d")
    else
      datetime.strftime("%d/%m/%y")
    end
  end

  def format_message_datetime_full(datetime)
    datetime.strftime("%d/%m/%Y で %l:%M %p")
  end
end
