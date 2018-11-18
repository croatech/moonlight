class FightsController < ApplicationController
  before_action :authenticate_user

  layout 'map'

  def create
    bot = current_location.bots.find(params[:bot_id])
    service = Fight::StartService.call(player: current_player, bot: bot)
    if service.success?
      redirect_to fight_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show; end
end
