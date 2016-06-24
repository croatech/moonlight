class PlayersController < ApplicationController

  before_action :authenticate_user!

  layout 'player'

  def show
    @player = current_user.player
    get_inventory_items
  end

  def inventory
    @player = current_user.player
    @weapons = Equipment::Item.where(id: @player.inventory).decorate
    @tools = Tool::Item.where(id: @player.tools).decorate
    @wearable_tools = Tool::Item.where(id: tools_ids)
    get_inventory_items
  end

  private

  def tools_ids
    Player::Inventory::Tool::AllItemsService.new(current_user.player).call
  end
end
