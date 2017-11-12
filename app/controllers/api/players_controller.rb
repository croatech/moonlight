class Api::PlayersController < ApplicationController
  before_action :authenticate_user!

  def current
    render json: PlayerQuery.call(current_player.id)
  end

  def online
    render json: Player.online, each_serializer: nil
  end
end
