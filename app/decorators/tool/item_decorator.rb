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

  private

  def is_skill_correct?(player, item)
    current_skill = player.public_send("#{item.type}_skill".to_sym)
    current_skill >= item.required_skill
  end
end
