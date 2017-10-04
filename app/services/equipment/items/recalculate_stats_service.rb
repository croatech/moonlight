class Equipment::Items::RecalculateStatsService
  def initialize(player, item)
    @player = player
    @item = item
  end

  def increase
    Player::STATS.each do |stat|
      next if stat.nil?
      player[stat] += item[stat]
    end

    player.save
  end

  def decrease
    Player::STATS.each do |stat|
      next if stat.nil?
      player[stat] -= item[stat]
    end

    player.save
  end

  private

  attr_reader :player, :item
end
