class Fight::VsPlayer

  def enemy
    Player.find(self.enemy_id)
  end

  def winner
    Player.find(self.winner_id)
  end
end