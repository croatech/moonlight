class Player::InventoryController < ApplicationController

  layout 'player'

  before_action :set_player

  def index
  end

  def equipment
    @weapons = Equipment::Item.where(id: @player.equipment).decorate
  end

  def tools
    @tools = Tool::Item.where(id: @player.tools).decorate
  end

  def resources
    @resources = @player.resources
  end

  private

  def set_player
    @player = current_user.player.decorate
    @wearable_equipment = @player.wearable_equipment
    @stats = @player.stats(@wearable_equipment)
    @wearable_tools = @player.wearable_tools
  end
end
