class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_for_an_active_fight

  def check_for_an_active_fight
    unless params[:controller] == 'rounds' || params[:controller] == 'devise'
      fight = Fight.active.where(player_id: current_user.player.id).take
      
      if fight.present?
        redirect_to fight_round_path(fight_id: fight.id, id: fight.rounds.last.id)
      end
    end
  end

end
