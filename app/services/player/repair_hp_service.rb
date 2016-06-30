class Player::RepairHpService

  attr_reader :player, :current_hp

  def initialize(player, current_hp)
    @player = player
    @current_hp = current_hp
  end

  def call
    player.current_hp = current_hp
    player.save
    Player::RepairHpWorker.perform_at(5.seconds.from_now, player.id, current_hp)
  end
end