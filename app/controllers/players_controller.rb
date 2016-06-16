class PlayersController < ApplicationController

  layout 'player'

  def show
    @player = current_user.player
    item_ids = Player::Inventory::AllEquipmentService.new(current_user.player).call
    @inventory_items = Item::Item.where(id: item_ids)
  end

  def inventory
    @player = current_user.player
    @items = Item::Item.where(id: @player.inventory).decorate
    item_ids = Player::Inventory::AllEquipmentService.new(current_user.player).call
    @inventory_items = Item::Item.where(id: item_ids)
  end
end
