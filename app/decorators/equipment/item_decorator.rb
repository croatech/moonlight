class Equipment::ItemDecorator < Draper::Decorator
  
  delegate_all

  include Rails.application.routes.url_helpers

  def level_status(player)
    if is_level_correct?(player, self)
      h.content_tag(:div, "[#{self.required_level}]")
    else
      h.content_tag(:div, "[#{self.required_level}]", class: 'red')
    end
  end

  def buy_or_sell_button(player)
    if is_level_correct?(player, self)
      if player.inventory.include?(self.id.to_s)
        h.link_to "Sell for #{self.sell_price.to_i} gold", equipment_item_sell_path(self.id), method: :post, class: 'btn btn-info'
      else
        h.link_to "Buy for #{self.price} gold", equipment_item_buy_path(self.id), method: :post, class: 'btn btn-info'
      end
    end
  end

  private

  def is_level_correct?(player, item)
    player.level >= item.required_level
  end
end
