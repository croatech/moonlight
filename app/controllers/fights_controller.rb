class FightsController < ApplicationController
  before_action :authenticate_user!

  def create
    bot = current_player.location.bots.find(params[:bot_id])
    service = Fight::StartService.call(player: current_player, bot: bot)
    if service.success?
      redirect_to fight_round_path(fight_id: service.object[:fight_id], id: service.object[:round_id])
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @player = current_player
    @fight = Fight.find(params[:id])
    @rounds = @fight.rounds.finished
    @winner = @fight.winner
    @player = @fight.player
    @bot = @fight.bot
  end
end
