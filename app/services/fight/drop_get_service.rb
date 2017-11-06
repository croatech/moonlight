class Fight::DropGetService

  attr_reader :fight, :player, :bot

  def initialize(fight, player, bot)
    @fight = fight
    @player = player
    @bot = bot
  end

  def call
    gold_has_dropped if bot.try_drop_gold
    item_has_dropped if bot.try_drop_item
    fight.save
    player.save
  end

  private

  def gold_has_dropped
    fight.dropped_gold = bot.drop_gold
    player.increment(:gold, fight.dropped_gold)
    add_event_to_log("Dropped <span>#{fight.dropped_gold}</span> gold from the enemy.")
  end

  def item_has_dropped
    dropped_item = bot.dropped_item
    fight.update(dropped_item: dropped_item)
    player.equipment_items << dropped_item
    add_event_to_log("Dropped <span>#{dropped_item.name}</span> from the enemy.")
  end

  def add_event_to_log(event)
    service = Log::AddEventService.new(player, event)
    service.call
  end
end
