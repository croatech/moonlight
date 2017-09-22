class Api::Player::StatsController < ApplicationController
  def increase
    service = Player::Stats::IncreaseService.call(player: current_player, stat: params[:stat_id])
    if service.success?
      render status: 200, json: service.player
    else
      render status: 500, json: service.error
    end
  end
end
