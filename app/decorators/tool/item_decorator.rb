class Tool::ItemDecorator < Draper::Decorator

  delegate_all

  include Rails.application.routes.url_helpers

  def level_of_skill(player, item_type)
    current_skill = player.public_send("#{item_type}_skill".to_sym)

    if current_skill < self.required_skill
      h.content_tag(:div, "#{self.type}[#{self.required_skill}]", class: 'red')
    else
      h.content_tag(:div, "#{self.type}[#{self.required_skill}]")
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
