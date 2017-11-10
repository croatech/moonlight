class Cells::ChangeCellService
  include Interactor

  def call
    pre_initialize

    context.fail! if active_movement_in_progress? || current_location_chosen? || inactive?

    Movements::CreateService.new(player, location).call
    track_event
  end

  private

  attr_reader :player, :location

  def pre_initialize
    @player = context.player
    @location = context.location
  end

  def active_movement_in_progress?
    player.active_movement.present?
  end

  def current_location_chosen?
    player.location_id == location.id
  end

  def inactive?
    player.location.inactive?
  end

  def track_event
    Log::AddEventService.new(player, "You\'ve changed the cell to <span>#{location.name}</span>").call
  end
end
