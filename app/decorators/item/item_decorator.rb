class Item::ItemDecorator < Draper::Decorator
  
  delegate_all

  include Rails.application.routes.url_helpers

  def level_status(profile)
    if profile.level < self.level
      h.content_tag(:div, self.level, class: 'red') if profile.level < self.level
    else
      h.content_tag(:div, self.level)
    end
  end

  def buy_or_wear_button(profile)
    if profile.inventory.include?(self.id.to_s)
      h.link_to "Wear", item_item_buy_path(self.id), method: :post, class: 'btn btn-info'
    else
      h.link_to "Buy for #{self.cost}", item_item_buy_path(self.id), method: :post, class: 'btn btn-info'
    end
  end
end
