class Fights::HitService

  attr_reader :fight, :round, :player, :bot, :player_defense_point, :player_attack_point, :bot_defense_point, :bot_attack_point

  def initialize(fight, defense_point, attack_point)
    @fight = fight
    @round = @fight.rounds.last
    @player = @fight.player
    @bot = @fight.bot
    @player_defense_point = defense_point
    @player_attack_point = attack_point
    @bot_defense_point = Player.const_get('SLOTS').sample
    @bot_attack_point = Player.const_get('SLOTS').sample
  end

  def call
    player_damage = calculate_player_damage
    bot_damage = calculate_bot_damage
    round.update(player_damage: player_damage, bot_damage: bot_damage, status: :finished)
    checking_for_finishing_fight(player_damage, bot_damage)
  end

  private

  def calculate_player_damage
    if point_is_blocked?(player_attack_point, bot_defense_point)
      0
    else
      hit_damage(player, bot)
    end
  end

  def calculate_bot_damage
    if point_is_blocked?(bot_attack_point, player_defense_point)
      0
    else
      hit_damage(bot, player)
    end
  end

  def point_is_blocked?(attack_point, defense_point)
    attack_point == defense_point
  end

  def hit_damage(attacker, defender)
    damage = attacker.attack - defender.defense * 0.25
    damage < 0 ? attacker.attack / 2 : damage
  end

  def checking_for_finishing_fight(player_damage, bot_damage)
    player_hp = round.player_hp - bot_damage
    bot_hp = round.bot_hp - player_damage

    if player_hp <= 0
      finish_fight(winner: bot.type)
    elsif bot_hp <= 0
      finish_fight(winner: 'Player')
      increase_player_exp
    else
      false
    end

    fight.rounds.create(player_hp: player_hp, bot_hp: bot_hp)
  end

  def finish_fight(winner:)
    fight.update(winner_type: winner, status: :finished)
  end

  def increase_player_exp
    Player::Exp::IncreaseService.new(player, bot.exp).call
  end
end