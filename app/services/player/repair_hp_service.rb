class Player::RepairHpService

  attr_reader :player, :current_hp, :final_hp

  def initialize(player)
    @player = player
    @current_hp = player.current_hp
    @final_hp = player.stats['hp']
  end

  def call
    if current_hp < final_hp
      Player::RepairHpWorker.perform_at(delay_period.seconds.from_now, player.id, restoring_hp)
    end
  end

  def restoring_hp
    final_hp * (Player::REGENERATION_HP_PERCENT.to_f / 100)
  end

  def delay_period
    Player::REGENERATION_HP_DELAY
  end
end