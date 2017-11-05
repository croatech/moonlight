class Api::FightsController < ApplicationController
  before_action :authenticate_user!

  def show
    fight = current_player.active_fight
    @player = fight.player
    @bot = fight.bot
    @round = fight.rounds.last
    @rounds = fight.rounds.finished.limit(5).order(id: :desc)
    @points = Fight::POINTS
    render json: fight
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
