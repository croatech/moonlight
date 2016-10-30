class Location::CurrentLocationService

  attr_reader :player

  def initialize(player)
    @player = player
  end

  def call
    player.location_id = location.id
    add_current_location_name_to_redis
    player.save
  end

  private

  def add_current_location_name_to_redis
    $redis.hset("player:#{player.id}", "location_name", location.name)
  end
end