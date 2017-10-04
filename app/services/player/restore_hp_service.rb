class Player::RestoreHpService
  def initialize(player)
    @player = player
  end

  def call
    return if player.current_hp >= player.hp
    Player::RestoreHpWorker.perform_at(delay_period.seconds.from_now, player.id, restoring_hp) if player.current_hp < player.hp
  end

  private

  attr_reader :player

  def restoring_hp
    player.hp * (Player::REGENERATION_HP_PERCENT.to_f / 100)
  end

  def delay_period
    Player::REGENERATION_HP_DELAY
  end
end
