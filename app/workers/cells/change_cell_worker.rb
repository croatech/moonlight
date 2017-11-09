class Cells::ChangeCellWorker
  include Sidekiq::Worker

  def perform(player_id, location_id)
    player.update(location: location)
  end
end
