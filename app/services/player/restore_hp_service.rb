class Player::RestoreHpService
  def initialize(player)
    @player = player
  end

  def call
    Player::RestoreHpWorker.perform_in(delay_period.seconds, player.id, restoring_hp)
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
