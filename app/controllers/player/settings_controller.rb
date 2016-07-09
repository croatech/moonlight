class Player::SettingsController < ApplicationController

  layout 'player'

  before_action :set_player

  def index

  end

  def change_frame
    current_user.player.public_send("#{params[:type]}!", :frame_size)
    redirect_to :back
  end

  private

  def set_player
    @player = current_user.player
  end
end
