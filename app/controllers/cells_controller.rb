class CellsController < ApplicationController
  layout 'map'

  def move
    change_cell(location_name(params[:cell_id]))
    redirect_back(fallback_location: root_path)
  end

  def show
    change_cell(location_name(params[:id]))
    @bots = @location.bots
    @resources = @location.resources
  end

  private

  def location_name(id)
    Location.find_by(slug: id).name
  end
end
