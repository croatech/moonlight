class CellsController < ApplicationController
  layout 'map'

  def move
    change_location(params[:cell_id])
    redirect_back(fallback_location: root_path)
  end

  def show
    change_location(params[:id])
    @bots = @location.bots
    @resources = @location.resources
  end

  private

  def change_location(location_id)
    @location = Location.find_by(slug: location_id).decorate
    Location::ChangeLocationService.new(current_user.player, @location.id).call
  end
end
