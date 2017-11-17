class Locations::ChangeLocationService
  def initialize(player, location)
    @player = player
    @location = location
  end

  def call
    return if active_movement_in_progress? || current_location_chosen?

    player.update(location: location)
    track_event
  end

  private

  attr_reader :player, :location

  def active_movement_in_progress?
    player.active_movement.present?
  end

  def current_location_chosen?
    player.location_id == location.id
  end

  def track_event
    Events::AddService.new(player,"You\'ve changed the location to <span>#{location.name}</span>").call
  end
end
