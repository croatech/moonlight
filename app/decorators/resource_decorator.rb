class ResourceDecorator < Draper::Decorator
  delegate_all

  include Rails.application.routes.url_helpers

  def collect_link(player)
    slot_name = "#{self.type}_slot"

    if player[slot_name] == self.item_id
      h.link_to 'Collect', resource_collect_path(resource_id: resource.id), method: :post, class: 'btn btn-primary'
    else
      h.link_to 'Buy item', craft_shop_locations_path, class: 'btn btn-danger'
    end
  end
end
