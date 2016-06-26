class Player::InventoryController < ApplicationController

  layout 'player'

  before_action :set_player

  def index
  end

  def equipment
    @weapons = Equipment::Item.where(id: @player.inventory).decorate
  end

  def tools
    @tools = Tool::Item.where(id: current_user.player.tools).decorate
  end

  def resources

  end

  private

  def set_player
    @player = current_user.player
    set_equipment_items
    @wearable_tools = get_tool_items
  end
end
