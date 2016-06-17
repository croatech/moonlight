class BotFight < Fight

  def enemy
    Bot.find(self.enemy_id)
  end

  def winner
    Bot.find(self.winner_id)
  end
end