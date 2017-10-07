class Api::PlayersController < ApplicationController
  before_action :authenticate_user!

  def current
    render json: PlayerQuery.call(current_player.id)
  end
end
