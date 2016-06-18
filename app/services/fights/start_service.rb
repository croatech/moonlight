class Fights::StartService

  attr_reader :player, :bot, :fight

  def initialize(player, bot_id)
    @player = player
    @bot = Bot.find(bot_id)
  end

  def call
    fight_create
    first_round_create
  end

  private

  def fight_create
    @fight = Fight.create(player_id: player.id, bot_id: bot.id)
  end

  def first_round_create
    fight.rounds.create(player_hp: player.hp, bot_hp: bot.hp)
  end
end