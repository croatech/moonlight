class Cells::ChangeCellService
  def initialize(player, location)
    @player = player
    @location = location
  end

  def call
    if player.active_movement.present?
      Movements::HandleService.new(player).call
    else
      Movements::CreateService.new(player, location).call
    end
  end

  private

  attr_reader :player, :location
end

#Cells::ChangeCellWorker.perform_in(Player::MOVEMENT_SPEED, player.id, location.id)