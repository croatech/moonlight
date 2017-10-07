class Player::InventoryController < ApplicationController
  layout 'player'

  before_action :authenticate_user!

  def index
    @player ||= current_player.decorate
  end
end
