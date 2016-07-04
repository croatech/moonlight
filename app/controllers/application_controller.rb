class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_for_an_active_fight
  before_action :log_get

  def check_for_an_active_fight
    unless params[:controller] == 'rounds' || params[:controller] == 'devise'
      fight = current_user.player.fights.active.take if current_user
      
      if fight.present?
        redirect_to fight_round_path(fight_id: fight.id, id: fight.rounds.last.id)
      end
    end
  end

  def current_location
    current_user.player.location
  end

  def check_for_correct_location(location_name)
    if current_location.slug == location_name
      true
    else
      redirect_to root_path
    end
  end

  def log_get
    @logs = current_user.player.logs.order('id DESC') if current_user
  end

  def log(event)
    service = Log::AddEventService.new(current_user.player, event)
    service.call
  end
end
