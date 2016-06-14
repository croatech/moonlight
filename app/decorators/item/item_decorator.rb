class Item::ItemDecorator < Draper::Decorator
  delegate_all

  def level_status(character)
    if character.level < self.level
      h.content_tag(:div, self.level, class: 'red') if character.level < self.level
    else
      h.content_tag(:div, self.level)
    end
  end

  def buy_button(character)
    
  end

end
