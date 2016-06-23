class Player::Stat::IncreaseService

  attr_reader :player, :stat

  def initialize(player, stat)
    @player = player
    @stat = stat
  end

  def call
    increasing_method = "increase_#{stat}".to_sym

    if player.free_stats > 0
      player.public_send(increasing_method)
      decrement_free_stats
    end
  end

  private

  def decrement_free_stats
    player.decrement!(:free_stats, 1)
  end
end