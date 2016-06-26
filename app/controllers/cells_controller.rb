class CellsController < ApplicationController

  layout 'map'

  def show
    change_location(params[:id])
    @bots = @location.bots
    @resources = @location.resources
  end

  private

  def change_location(location_id)
    @location = Location.find_by(slug: location_id)
    Locations::ChangeLocationService.new(current_user.player, @location.id).call
  end
end
