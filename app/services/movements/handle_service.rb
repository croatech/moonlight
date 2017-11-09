class Movements::HandleService
  def initialize(player)
    @player = player
  end

  def call
    @movement = player.active_movement

    next_location_id = determine_next_location_id
    if next_location_id.nil?
      movement.completed!
      return
    end

    run_worker(next_location_id)
  end

  private

  attr_reader :player, :movement

  def run_worker(location_id)
    Cells::ChangeCellWorker.perform_in(Player::MOVEMENT_SPEED, player.id, location_id)
  end

  def determine_next_location_id
    path_array = movement.path.map(&:to_i)
    index_of_next_location_id = path_array.find_index(player.location_id) + 1
    return path_array[index_of_next_location_id]
  end
end
