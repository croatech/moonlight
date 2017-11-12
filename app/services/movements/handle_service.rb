class Movements::HandleService
  def initialize(player)
    @player = player
  end

  def call
    @movement = player.active_movement

    next_location_id = determine_next_location_id
    if next_location_id.nil?
      movement.completed!
      ws_publish
    else
      run_worker(next_location_id)
    end
  end

  private

  attr_reader :player, :movement

  def run_worker(next_location_id)
    Cells::ChangeCellWorker.perform_in(Player::MOVEMENT_SPEED, player.id, next_location_id)
  end

  def determine_next_location_id
    path_array = movement.path.map(&:to_i)
    index_of_next_location_id = path_array.find_index(player.location_id) + 1
    return path_array[index_of_next_location_id]
  end

  def ws_publish
    ActionCable.server.broadcast("movement_#{movement.id}", PlayerSerializer.new(player))
  end
end
