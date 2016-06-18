class FightsController < ApplicationController

  def create
    service = Fights::StartService.new(current_user.player.id, params[:enemy_id], params[:enemy_type])
    service.call
    redirect_to :back
  end
end
