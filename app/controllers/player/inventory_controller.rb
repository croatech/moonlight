class Player::InventoryController < ApplicationController

  layout 'player'

  before_action :set_player

  def index
  end

  def equipment
    @weapons = Equipment::Item.where(id: @player.equipment).decorate
  end

  def tools
    @tools = Tool::Item.where(id: current_user.player.tools).decorate
  end

  def resources
    @resources = current_user.player.resources
  end

  private

  def set_player
    @player = current_user.player.decorate

    wearable_equipment_ids = Player::Inventory::WearableItemsIdsService.new(current_user.player, Player::EQUIPMENT_SLOTS).call
    @wearable_eqipment = Equipment::Item.where(id: wearable_equipment_ids).includes(:category)

    wearable_tools_ids = Player::Inventory::WearableItemsIdsService.new(current_user.player, Player::TOOL_SLOTS).call
    @wearable_tools = Tool::Item.where(id: wearable_tools_ids).includes(:category)
  end
end
