class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_for_an_active_fight
  before_action :log_get

  def check_for_an_active_fight
    unless params[:controller] == 'rounds' || params[:controller] == 'devise'
      fight = Fight.active.where(player_id: current_user.player.id).take if current_user
      
      if fight.present?
        redirect_to fight_round_path(fight_id: fight.id, id: fight.rounds.last.id)
      end
    end
  end

  def current_location
    current_user.player.location
  end

  def set_equipment_items
    items = Equipment::Item.all
    player = current_user.player

    Player::SLOTS.each do |slot|
      self.instance_variable_set "@#{slot}", items.find_by(id: player["#{slot}_slot"])
    end
  end

  def get_tool_items
    Tool::Item.where(id: tools_ids)
  end

  def log_get
    @logs = Log::EventsGetService.new(current_user.player).call if current_user
  end

  def log(event)
    service = Log::AddEventService.new(current_user.player, event)
    service.call
  end

  private

  def tools_ids
    Player::Inventory::Tool::AllItemsService.new(current_user.player).call
  end
end
