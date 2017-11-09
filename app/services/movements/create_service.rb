class Movements::CreateService
  def initialize(player, location)
    @player = player
    @location = location
  end

  def call
    path = find_shortest_path
    player.movements.create(path: path, status: 'active')
    handle_movement
  end

  private

  attr_reader :player, :location

  def find_shortest_path
    Locations::FindShortestPathService.new(from_location_id: player.location.id, to_location_id: location.id).call
  end

  def handle_movement
    Movements::HandleService.new()
  end
end