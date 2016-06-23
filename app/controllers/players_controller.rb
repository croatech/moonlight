class PlayersController < ApplicationController

  before_action :authenticate_user!

  layout 'player'

  def show
    @player = current_user.player
    item_ids = Player::Inventory::AllEquipmentService.new(current_user.player).call
    @inventory_items = Equipment::Item.where(id: item_ids)
  end

  def inventory
    @player = current_user.player
    @weapons = Equipment::Item.where(id: @player.inventory).decorate
    @tools = Tool::Item.where(id: @player.tools).decorate
    item_ids = Player::Inventory::AllEquipmentService.new(current_user.player).call
    @inventory_items = Equipment::Item.where(id: item_ids)
  end
end
