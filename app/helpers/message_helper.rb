module MessageHelper
  def format_message_datetime_compact(datetime)
    datetime_format =
      if datetime.to_date == Time.current.to_date
        "%l:%M %p"
      elsif datetime.year == Time.current.year
        "%b %d"
      else
        "%d/%m/%y"
      end
    datetime.strftime(datetime_format)
  end

  def format_message_datetime_full(datetime)
    datetime.strftime("%d/%m/%Y で %l:%M %p")
  end
end
