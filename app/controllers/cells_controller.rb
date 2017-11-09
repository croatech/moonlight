class CellsController < ApplicationController
  layout 'map'

  def move
    return if current_player.active_movement.present?
    change_cell(location_name(params[:cell_id]))
    redirect_back(fallback_location: root_path)
  end

  def show
    @location = Location.find_by(name: cell_name).decorate
    @bots = @location.bots
    @resources = @location.resources
  end

  private

  def location_name(id)
    Location.find_by(slug: id).name
  end
end
