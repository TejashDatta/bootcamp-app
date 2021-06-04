module ApplicationHelper
  def field_for_column_type(model, column)
    case model.column_for_attribute(column).type
    when :date then :date_field
    else :text_field
    end
  end
end
