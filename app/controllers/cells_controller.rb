class CellsController < ApplicationController
  layout 'map'

  def show
    @location = Location.find_by(slug: params[:id]).decorate
    @bots = @location.bots
    @resources = @location.resources
  end
end
