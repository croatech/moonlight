class Cells::ChangeCellWorker
  include Sidekiq::Worker

  def perform(player_id, location_id)
    player = Player.find(player_id)
    location = Location.find(location_id)
    player.update(location: location)

    ActionCable.server.broadcast("movement_#{player.active_movement.id}", PlayerSerializer.new(player))

    Movements::HandleService.new(player).call
  end
end
