class Equipment::ItemDecorator < Draper::Decorator
  
  delegate_all

  include Rails.application.routes.url_helpers

  def level_status(player)
    if player.level < self.level
      h.content_tag(:div, self.level, class: 'red')
    else
      h.content_tag(:div, self.level)
    end
  end

  def buy_or_sell_button(player)
    if player.inventory.include?(self.id.to_s)
      h.link_to "Sell for #{self.sell_price.to_i} gold", equipment_item_sell_path(self.id), method: :post, class: 'btn btn-info'
    else
      h.link_to "Buy for #{self.price} gold", equipment_item_buy_path(self.id), method: :post, class: 'btn btn-info'
    end
  end
end
