class Player::RepairHpService

  attr_reader :player, :current_hp

  def initialize(player)
    @player = player
    @current_hp = current_hp
  end

  def call
    player.current_hp = current_hp
    player.save
    Player::RepairHpWorker.perform_at(5.seconds.from_now, player.id, current_hp)

    if current_hp < player.hp

    end
  end

  private

  def worker_count
    filled_hp_percent = (player.current_hp.to_f / player.hp.to_f) * 100
  end
end

increasing_hp = player.hp * (Player::REGENERATION_HP_PERCENT.to_f / 100)