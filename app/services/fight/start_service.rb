class Fight::StartService
  include Interactor

  def call
    pre_initialize
    fight_create
    first_round_create
    context.object = { fight_id: fight.id, round_id: round.id }
  end

  private

  attr_reader :player, :bot, :fight, :round

  def pre_initialize
    @player = context.player
    @bot = context.bot
  end

  def fight_create
    @fight = Fight.create(player: player, bot: bot)
  end

  def first_round_create
    @round = fight.rounds.create(player_hp: player.current_hp, bot_hp: bot.hp)
  end
end
