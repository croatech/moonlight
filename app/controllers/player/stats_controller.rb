class Player::StatsController < ApplicationController

  layout 'player'

  def index
    @player = current_user.player
    get_inventory_items
  end

  def increase
    service = Player::Stat::IncreaseService.new(current_user.player, params[:stat_id])
    service.call
    redirect_to :back
  end
end
