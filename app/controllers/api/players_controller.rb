class Api::PlayersController < ApplicationController
  before_action :authenticate_user!

  def current
    render json: current_player
  end
end
