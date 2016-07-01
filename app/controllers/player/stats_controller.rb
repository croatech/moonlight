class Player::StatsController < ApplicationController

  layout 'player'

  def index
    @player = current_user.player.decorate
    wearable_equipment_ids = Player::Inventory::WearableItemsIdsService.new(current_user.player, Player::EQUIPMENT_SLOTS).call
    @wearable_eqipment = Equipment::Item.where(id: wearable_equipment_ids).includes(:category)

    wearable_tools_ids = Player::Inventory::WearableItemsIdsService.new(current_user.player, Player::TOOL_SLOTS).call
    @wearable_tools = Tool::Item.where(id: wearable_tools_ids).includes(:category)
  end

  def increase
    service = Player::Stat::IncreaseService.new(current_user.player, params[:stat_id])
    service.call
    redirect_to :back
  end
end
