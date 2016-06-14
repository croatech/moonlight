module Items::ItemsHelper

  def requirement_status_color(value1, value2)
    'red' if value1 < value2
  end
end
