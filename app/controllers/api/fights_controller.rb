class Api::FightsController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: { fight: FightSerializer.new(current_player.active_fight), points: Fight::POINTS }
  end

  def update
    form_params = params.values[3]
    fight = Fight.find(params[:fight_id])
    Fight::HitService.new(fight, form_params['defense'], form_params['attack']).call

    if fight.finished?
      redirect_to fight_path(fight.id)
    else
      redirect_to fight_process_path(fight_id: fight.id)
    end
  end
end
