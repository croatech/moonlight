class Player::StatsController < ApplicationController

  layout 'player'

  def index
    @player = current_user.player.decorate
    @wearable_eqipment = @player.wearable_equipment
    @stats = @player.stats(@wearable_eqipment)
    @wearable_tools = @player.wearable_tools
  end

  def increase
    service = Player::Stats::IncreaseService.new(current_user.player, params[:stat_id])
    service.call
    redirect_to :back
  end
end
