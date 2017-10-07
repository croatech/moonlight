class Api::PlayersController < ApplicationController
  before_action :authenticate_user!

  def current
    render json: Player.includes(equipment_items: :category)
      .includes(tool_items: :category)
      .includes(:resources)
      .find(current_player.id)
  end
end
