class PlayersController < ApplicationController

  before_action :authenticate_user!

  layout 'player'

  def show
    @player = Player.find_by(name: params[:id]).decorate
    @wearable_equipment = @player.wearable_equipment
    @stats = @player.stats(@wearable_equipment)
    @wearable_tools = @player.wearable_tools
  end
end
