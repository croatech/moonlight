class Equipment::ItemDecorator < Draper::Decorator
  delegate_all

  include Rails.application.routes.url_helpers

  #TODO delete
  def level_status(player)
    if is_level_correct?(player, self)
      h.content_tag(:div, "[#{self.required_level}]")
    else
      h.content_tag(:div, "[#{self.required_level}]", class: 'red')
    end
  end

  private

  def is_level_correct?(player, item)
    player.level >= item.required_level
  end
end
