class CellsController < ApplicationController

  layout 'map'

  def index
    @location = Location.find_by(slug: params[:location_id])
    @cells = @location.children.order(:id)
    change_location(@location.id)
  end

  def show
    @location = Location.find(params[:id])
    change_location(@location.id)
  end

  private

  def change_location(location_id)
    Locations::ChangeLocationService.new(current_user.player, @location.id).call
  end
end
