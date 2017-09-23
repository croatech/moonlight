class Player::Stats::IncreaseService
  include Interactor

  def call
    pre_initialize

    increasing_method = "increase_#{stat}".to_sym

    if player_has_free_stats? && accessible_stat?
      ActiveRecord::Base.transaction do
        player.public_send(increasing_method)
        player.decrement!(:free_stats, 1)
      end

      context.player = player
    else
      context.fail!(error: 'You have no free stats')
    end
  end

  private

  attr_reader :player, :stat

  def pre_initialize
    @player = context.player
    @stat = context.stat
  end

  def player_has_free_stats?
    player.free_stats > 0
  end

  def accessible_stat?
    Player::STATS.include?(stat)
  end
end
