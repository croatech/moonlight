class Fight::DropGetService

  attr_reader :fight, :player, :bot

  def initialize(fight, player, bot)
    @fight = fight
    @player = player
    @bot = bot
  end

  def call
    gold_has_dropped if bot.try_drop_gold_chance
    item_has_dropped if bot.try_drop_item_chance
    fight.save
    player.save
  end

  private

  def gold_has_dropped
    fight.dropped_gold = bot.drop_gold
    player.increment(:gold, fight.dropped_gold)
  end

  def item_has_dropped
    fight.dropped_item = bot.drop_item
    player.inventory << fight.dropped_item
  end
end