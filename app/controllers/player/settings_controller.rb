class Player::SettingsController < ApplicationController

  layout 'player'

  before_action :set_player

  def index
  end

  def avatar
    @avatars = Avatar.not_private
  end
  
  def change_avatar
    avatar = Avatar.not_private.find(params[:avatar_id])
    current_user.player.update_attribute(:avatar_id, avatar.id)
    redirect_back(fallback_location: root_path)
  end

  private

  def set_player
    @player = current_user.player
  end
end
