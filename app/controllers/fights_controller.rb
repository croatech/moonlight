class FightsController < ApplicationController

  before_action :authenticate_user!

  def create
    service = Fights::StartService.new(current_user.player, params[:bot_id])
    service.call
    redirect_to :back
  end

  def show
    @player = current_user.player
    @fight = Fight.find(params[:id])
    @rounds = @fight.rounds
    @winner = @fight.winner
  end
end
