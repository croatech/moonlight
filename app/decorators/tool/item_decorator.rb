class Tool::ItemDecorator < Draper::Decorator

  delegate_all

  include Rails.application.routes.url_helpers

  def level_of_skill(player)
    if is_skill_correct?(player, self)
      h.content_tag(:div, "[#{self.required_skill}]")
    else
      h.content_tag(:div, "[#{self.required_skill}]", class: 'red')
    end
  end

  def buy_or_sell_button(player)
    if is_skill_correct?(player, self)
      if player.tools.include?(self.id.to_s) 
        h.link_to "Sell for #{self.sell_price.to_i} gold", tool_item_sell_path(self.id), method: :post, class: 'btn btn-info'
      else
        h.link_to "Buy for #{self.price} gold", tool_item_buy_path(self.id), method: :post, class: 'btn btn-info'
      end
    end
  end

  private

  def is_skill_correct?(player, item)
    current_skill = player.public_send("#{item.type}_skill".to_sym)
    current_skill >= item.required_skill
  end
end
