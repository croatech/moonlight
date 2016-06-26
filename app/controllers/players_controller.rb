class PlayersController < ApplicationController

  before_action :authenticate_user!

  layout 'player'

  def show
    @player = current_user.player
    set_equipment_items
    @wearable_tools = get_tool_items
  end
end
