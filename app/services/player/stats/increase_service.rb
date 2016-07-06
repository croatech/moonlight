class Player::Stats::IncreaseService

  attr_reader :player, :stat

  def initialize(player, stat)
    @player = player
    @stat = stat
  end

  def call
    increasing_method = "increase_#{stat}".to_sym

    if player.free_stats > 0
      player.public_send(increasing_method)
      player.decrement!(:free_stats, 1)
    end
  end
end