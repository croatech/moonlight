class Cells::ChangeCellWorker
  include Sidekiq::Worker

  def perform(player_id, location_id)
    player = Player.find(player_id)
    location = Location.find(location_id)
    player.update(location: location)

    ActionCable.server.broadcast("movement_#{player.active_movement.id}", PlayerSerializer.new(player))
    Events::AddService.new(player, "You\'ve changed the cell to <span>#{location.name}</span>").call

    Movements::HandleService.new(player).call
  end
end
