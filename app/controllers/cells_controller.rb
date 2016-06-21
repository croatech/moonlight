class CellsController < ApplicationController

  layout 'map'

  def index
    change_location(params[:location_id])
    @cells = @location.children.order(:id)
  end

  def show
    change_location(params[:id])
  end

  private

  def change_location(location_name)
    @location = Location.find_by(slug: location_name)
    Locations::ChangeLocationService.new(current_user.player, @location.id).call
  end
end
