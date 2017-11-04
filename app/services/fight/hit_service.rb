class Fight::HitService
  attr_reader :fight, :round, :player, :bot, :player_defense_point, :player_attack_point, :bot_defense_point, :bot_attack_point

  def initialize(fight, defense_point, attack_point)
    @fight = fight
    @round = @fight.rounds.last
    @player = @fight.player
    @bot = @fight.bot
    @player_defense_point = defense_point
    @player_attack_point = attack_point
    @bot_defense_point = Player::EQUIPMENT_SLOTS.sample
    @bot_attack_point = Player::EQUIPMENT_SLOTS.sample
  end

  def call
    player_damage = calculate_damage(player, bot)
    bot_damage = calculate_damage(bot, player)
    round.update(player_damage: player_damage, bot_damage: bot_damage, status: :finished)
    checking_for_finishing_fight(player_damage, bot_damage)
    player.save
  end

  private

  def calculate_damage(attacker, defender)
    return 0 if point_is_blocked?(attacker)

    main_damage = attacker.attack - defender.defense * 0.25
    additional_level_damage = ((attacker.level - defender.level) * 0.10) * main_damage
    main_damage + additional_level_damage
  end

  def point_is_blocked?(attacker)
    if attacker.class.is_a?(Player)
      player_attack_point == bot_defense_point
    else
      bot_attack_point == player_defense_point
    end
  end

  def checking_for_finishing_fight(player_damage, bot_damage)
    player_hp = round.player_hp - bot_damage
    bot_hp = round.bot_hp - player_damage

    if player_hp <= 0
      finish_fight(winner: bot.name)
      player.current_hp = 0
    elsif bot_hp <= 0
      finish_fight(winner: 'Player')
      player.current_hp = player_hp
      increase_player_exp
      drop_get
    else
      false
    end

    fight.rounds.create(player_hp: player_hp, bot_hp: bot_hp)
  end

  def finish_fight(winner:)
    fight.update(winner_type: winner, status: :finished)
    start_restore_hp
  end

  def increase_player_exp
    Player::Exp::IncreaseService.new(player, bot.given_exp).call
  end

  def drop_get
    Fight::DropGetService.new(fight, player, bot).call
  end

  def start_restore_hp
    Player::RestoreHpService.new(player).call
  end
end
