class FightsController < ApplicationController

  before_action :authenticate_user!

  def create
    Fight::StartService.new(current_user.player, params[:bot_id]).call
    redirect_back(fallback_location: root_path)
  end

  def show
    @player = current_player
    @fight = Fight.find(params[:id])
    @rounds = @fight.rounds.where("player_damage IS NOT NULL")
    @winner = @fight.winner
    @player = @fight.player
    @bot = @fight.bot
  end
end
