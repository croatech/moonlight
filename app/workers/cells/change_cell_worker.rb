class Cells::ChangeCellWorker
  include Sidekiq::Worker

  def perform(player_id, location_id)
    player = Player.find(player_id)
    location = Location.find(location_id)
    player.update(location: location)
    Movements::HandleService.new(player).call
  end
end
