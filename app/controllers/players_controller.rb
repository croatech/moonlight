class PlayersController < ApplicationController

  before_action :authenticate_user!

  layout 'player'

  def show
    @player = current_user.player
    @wearable_weapons = Equipment::Item.where(id: weapons_ids)
  end

  def inventory
    @player = current_user.player
    @weapons = Equipment::Item.where(id: @player.inventory).decorate
    @tools = Tool::Item.where(id: @player.tools).decorate
    @wearable_weapons = Equipment::Item.where(id: weapons_ids)
    @wearable_tools = Tool::Item.where(id: tools_ids)
  end

  private

  def weapons_ids
    Player::Inventory::Equipment::AllItemsService.new(current_user.player).call
  end

  def tools_ids
    Player::Inventory::Tool::AllItemsService.new(current_user.player).call
  end
end
