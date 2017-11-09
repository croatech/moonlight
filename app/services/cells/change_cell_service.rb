class Cells::ChangeCellService
  def initialize(player, location)
    @player = player
    @location = location
  end

  def call
    return if active_movement_in_progress? || current_location?

    Movements::CreateService.new(player, location).call
  end

  private

  attr_reader :player, :location

  def active_movement_in_progress?
    player.active_movement.present?
  end

  def current_location?
    player.location_id == location.id
  end
end
