class CellsController < ApplicationController

  layout 'map'

  def show
    change_location(params[:id])
    @bots = @location.bots
  end

  private

  def change_location(location_name)
    @location = Location.find_by(slug: location_name)
    Locations::ChangeLocationService.new(current_user.player, @location.id).call
  end
end
