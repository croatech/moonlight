class Player::SettingsController < ApplicationController

  def change_frame
    #service = Player::Settings::ChangeFrameService.new(params[:type])
    #service.call
    current_user.player.public_send("#{params[:type]}!", :frame_size)
    redirect_to :back
  end
end
