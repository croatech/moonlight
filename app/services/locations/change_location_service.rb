class Locations::ChangeLocationService
  def initialize(player, location)
    @player = player
    @location = location
  end

  def call
    player.update(location: location)
  end

  private

  attr_reader :player, :location
end
