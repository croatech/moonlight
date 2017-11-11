class Api::CellsController < ApplicationController
  before_action :authenticate_user!

  def move
    location = Location.find(params[:cell_id])
    service = Cells::ChangeCellService.call(player: current_player, location: location)
    if service.success?
      render status: 200, json: current_player
    else
      render status: 500, body: nil
    end
  end
end
