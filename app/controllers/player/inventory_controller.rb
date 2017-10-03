class Player::InventoryController < ApplicationController
  layout 'player'

  before_action :authenticate_user!

  def index
    load_player
    load_weapons
    load_resources
  end

  def equipment
    load_player
    load_weapons
  end

  def tools
    load_player
    load_tools
  end

  def resources
    load_player
    load_resources
  end

  private

  def load_player
    @player ||= current_user.player.decorate
    @wearable_equipment = @player.wearable_equipment
    @stats = @player.stats(@wearable_equipment)
    @wearable_tools = @player.wearable_tools
  end

  def load_weapons
    @weapons ||= @player.equipment_items.decorate
  end

  def load_tools
    @tools ||= @player.tool_items.decorate
  end

  def load_resources
    @resources ||= @player.resources
  end
end
