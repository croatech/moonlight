class ApplicationController < ActionController::Base
  include Knock::Authenticable

  protect_from_forgery

  #before_action :check_for_an_active_fight

  include CustomErrors

  def check_for_an_active_fight
    unless params[:controller] == 'fights' || params[:controller] == 'devise'
      redirect_to fight_path if current_player.last_fight.active?
    end
  end

  def current_player
    @current_player ||= current_user.player
  end

  def current_location
    @current_location ||= current_player.location
  end

  def check_for_correct_location(location_name)
    return true if current_location.slug == location_name
    redirect_to root_path
  end

  def add_event_to_log(event)
    Events::AddService.new(current_user.player, event).call
  end

  def change_location(location_name)
    @location = Location.find_by(name: location_name).decorate
    Locations::ChangeLocationService.new(current_player, @location).call
  end

  private

  def after_sign_in_path_for(resource)
    wayward_pines_locations_path
  end
end
