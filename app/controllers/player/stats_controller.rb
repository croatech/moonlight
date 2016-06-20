class Player::StatsController < ApplicationController

  layout 'player'

  def index
    @player = current_user.player
    item_ids = Player::Inventory::AllEquipmentService.new(current_user.player).call
    @inventory_items = Equipment::Item.where(id: item_ids)
  end

  def increase
    service = Player::Stats::IncreaseService.new(current_user.player, params[:stat_id])
    service.call
    redirect_to :back
  end
end
