class PlayerDecorator < Draper::Decorator
  delegate_all

  include Rails.application.routes.url_helpers

  def current_location_path
    current_location = self.location

    if current_location.cell?
      h.link_to "Back to #{current_location.name}", location_cell_path(location_id: current_location.parent.id, id: current_location.slug), class: 'btn btn-success'
    else
      h.link_to "Back to #{current_location.name}", location_path(current_location.slug), class: 'btn btn-success'
    end
  end

  def current_skill(resource)
    skill_name = "#{resource.type}_skill"
    self[skill_name]
  end

  def current_hp_get
    current_hp ? "#{current_hp} / #{hp}  HP" : "#{hp} / #{hp}  HP"
  end

  def current_exp_get
    "EXP: #{exp} / #{exp_next}"
  end
end
