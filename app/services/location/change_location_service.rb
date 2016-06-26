class Location::ChangeLocationService

  attr_reader :player, :location_id

  def initialize(player, location_id)
    @player = player
    @location_id = location_id
  end

  def call
    player.location_id = location_id
    player.save
  end
end