class CellsController < ApplicationController
  layout 'map'

  def move
    @location = Location.find_by(name: location_name(params[:cell_id])).decorate
    Cells::ChangeCellService.new(current_player, @location).call
    add_event_to_log("You\'ve changed the cell to <span>#{@location.name}</span>")
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
