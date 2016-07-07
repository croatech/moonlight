class FightsController < ApplicationController

  before_action :authenticate_user!

  def create
    service = Fight::StartService.new(current_user.player, params[:bot_id])
    service.call
    redirect_to :back
  end

  def show
    @player = current_user.player
    @fight = Fight.find(params[:id])
    @rounds = @fight.rounds.where("player_damage IS NOT NULL")
    @winner = @fight.winner
    @player = @fight.player
    @bot = @fight.bot
  end
end
