class RoundsController < ApplicationController

  def show
    service = Fights::RoundProcessService.new(params[:fight_id], params[:id])
    service.call
    fight = Fight.find(params[:fight_id])
    
    if fight.finished
      redirect_to fight_path(fight.id)
    else
      redirect_to fight_round_path(fight_id: fight.id, id: fight.rounds.last.id)
    end
  end
end
