class ResourceDecorator < Draper::Decorator
  delegate_all

  include Rails.application.routes.url_helpers

  def collect_link(player)
    slot_name = "#{self.type}_slot"

    if player[slot_name] == self.item_id
      h.link_to 'Collect', '#modal', class: 'btn btn-primary', id: 'collect'
    else
      h.link_to 'Buy tool', craft_shop_locations_path, class: 'btn btn-danger'
    end
  end
end
