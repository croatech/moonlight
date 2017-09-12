class Equipment::ItemDecorator < Draper::Decorator
  
  delegate_all

  include Rails.application.routes.url_helpers

  #TODO delete
  def buy_or_sell_button(player)
    if player.equipment.include?(self.id.to_s)
      h.link_to "Sell for #{self.sell_price.to_i} gold", equipment_item_sell_path(self.id), method: :put, class: 'btn btn-info'
    else
      class_name = player.gold >= self.price ? 'success' : 'danger'
      h.link_to "Buy for #{self.price} gold", equipment_item_buy_path(self.id), method: :put, class: "btn btn-#{class_name}"
    end
  end

  def put_on_button
    h.link_to 'Put on', equipment_item_put_on_path(self.id), method: :put, class: 'btn btn-info'
  end
end
