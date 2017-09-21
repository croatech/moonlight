class Api::Player::StatsController < ApplicationController

  def increase
    service = Player::Stats::IncreaseService.new(current_player, params[:stat_id])
    service.call
    redirect_back(fallback_location: root_path)
  end
end
