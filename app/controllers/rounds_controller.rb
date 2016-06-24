class RoundsController < ApplicationController

  before_action :authenticate_user!

  def show
    fight = Fight.find(params[:fight_id])
    @player = fight.player
    @bot = fight.bot
    @round = fight.rounds.last
    @slots = Player::SLOTS
    redirect_to fight_path(fight.id) if fight.finished?
  end

  def update
    form_params = params.values[3]
    fight = Fight.find(params[:fight_id])
    service = Fight::HitService.new(fight, form_params['defense'], form_params['attack'])
    service.call

    fight = Fight.find(params[:fight_id])
    if fight.finished?
      redirect_to fight_path(fight.id)
    else
      redirect_to fight_round_path(fight_id: fight.id, id: fight.rounds.last.id)
    end
  end
end
