class CellsController < ApplicationController
  layout 'map'

  def show
    @location = Location.find(params[:cell_id])
    Cells::ChangeCellService.new(current_player, @location).call
    @bots = @location.bots
    @resources = @location.resources
  end
end
