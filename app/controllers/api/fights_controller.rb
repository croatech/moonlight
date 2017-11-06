class Api::FightsController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: { fight: FightSerializer.new(current_player.last_fight), points: Fight::POINTS }
  end

  def update
    fight = current_player.last_fight
    Fight::HitService.new(fight, params[:defensePoint], params[:attackPoint]).call
    render json: { fight: FightSerializer.new(current_player.last_fight), points: Fight::POINTS }
  end
end
