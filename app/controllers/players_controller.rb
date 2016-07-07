class PlayersController < ApplicationController

  before_action :authenticate_user!

  layout 'player'

  def show
    @player = current_user.player
  end
end
