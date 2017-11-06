class Fight::StartService
  include Interactor

  def call
    pre_initialize
    raise_if_there_is_an_active_fight
    fight_create
    first_round_create
    context.fight_id = fight.id
  end

  private

  attr_reader :player, :bot, :fight, :round

  def pre_initialize
    @player = context.player
    @bot = context.bot
  end

  def raise_if_there_is_an_active_fight
    context.fail!(error: 'Player has an active fight') if player.last_fight.active?
  end

  def fight_create
    @fight = Fight.create(player: player, bot: bot)
  end

  def first_round_create
    @round = fight.rounds.create(player_hp: player.current_hp, bot_hp: bot.hp)
  end
end
