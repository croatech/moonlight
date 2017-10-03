class Equipment::Items::RecalculateStatsService
  def self.increase(player, item)
    Player::STATS.each do |stat|
      next if stat.nil?
      player[stat] += item[stat]
    end

    player.save
  end

  def self.decrease(player, item)
    Player::STATS.each do |stat|
      next if stat.nil?
      player[stat] -= item[stat]
    end

    player.save
  end
end