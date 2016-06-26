class PlayersController < ApplicationController

  before_action :authenticate_user!

  layout 'player'

  def show
    @player = current_user.player
    get_inventory_items
    get_tool_items
  end

  def inventory
    @player = current_user.player
    @weapons = Equipment::Item.where(id: @player.inventory).decorate
    get_inventory_items
    get_tool_items
  end
end
