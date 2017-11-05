class Fight::StartService
  include Interactor

  def call
    pre_initialize
    check_for_an_active_fight
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

  def check_for_an_active_fight
    context.fail!(error: 'Player has an active fight') if player.active_fight.present?
  end

  def fight_create
    @fight = Fight.create(player: player, bot: bot)
  end

  def first_round_create
    @round = fight.rounds.create(player_hp: player.current_hp, bot_hp: bot.hp)
  end
end
