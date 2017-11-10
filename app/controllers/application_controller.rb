class ApplicationController < ActionController::Base
  protect_from_forgery

  skip_before_action :verify_authenticity_token

  #before_action :check_for_an_active_fight
  before_action :load_logs
  before_action :online_players
  before_action :configure_permitted_parameters, if: :devise_controller?

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

  def load_logs
    @logs = current_user.player.logs.order(id: :desc) if current_user
  end

  def online_players
    @online_players = Player.recently_online
  end

  def add_event_to_log(event)
    Log::AddEventService.new(current_user.player, event).call
  end

  def change_location(location_name)
    @location = Location.find_by(name: location_name).decorate
    Locations::ChangeLocationService.new(current_player, @location).call
    add_event_to_log("You\'ve changed the location to <span>#{@location.name}</span>")
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
