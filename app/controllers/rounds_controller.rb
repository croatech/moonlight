class RoundsController < ApplicationController

  before_action :authenticate_user!

  def show
    fight = Fight.find(params[:fight_id])
    @player = fight.player
    @bot = fight.bot
    @round = fight.rounds.last
    @points = Fight::POINTS
    redirect_to fight_path(fight.id) if fight.finished?
  end

  def update
    form_params = params.values[3]
    fight = Fight.find(params[:fight_id])
    service = Fight::HitService.new(fight, form_params['defense'], form_params['attack'])
    service.call

    if fight.finished?
      if fight.dropped_gold.present?
        @dropped_gold = fight.dropped_gold
        log("Dropped <span>#{@dropped_gold}</span> gold from the enemy.")
      end

      if fight.dropped_item.present?
        @dropped_item = Equipment::Item.find(fight.dropped_item)
        log("Dropped <span>#{@dropped_item.name}</span> from the enemy.")
      end

      redirect_to fight_path(fight.id)
    else
      redirect_to fight_round_path(fight_id: fight.id, id: fight.rounds.last.id)
    end
  end
end
