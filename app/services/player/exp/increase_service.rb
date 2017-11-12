class Player::Exp::IncreaseService

  attr_reader :player, :new_exp

  def initialize(player, new_exp)
    @player = player
    @new_exp = new_exp
  end

  def call
    if player_has_got_new_level?
      level_up
    else
      player.increment!(:exp, new_exp)
      Events::AddService.new(player, "You've earn <span>#{new_exp}</span> EXP").call
    end

    self
  end

  private

  def player_has_got_new_level?
    player.exp_next - player.exp <= new_exp
  end

  def level_up
    difference = new_exp - (player.exp_next - player.exp)
    player.increment!(:level, 1)
    player.update(free_stats: player.free_stats + 10, 
                  gold: player.gold + player.level_up_gold, 
                  exp: difference, 
                  exp_next: player.level_up_exp)
  end
end