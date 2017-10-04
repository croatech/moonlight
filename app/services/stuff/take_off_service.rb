class Stuff::TakeOffService
  include Interactor

  def call
    pre_initialize

    if is_an_item_weared?
      ActiveRecord::Base.transaction do
        put_the_current_item_to_the_inventory
        decrease_stats
        clear_slot
        player.save
      end
    else
      context.fail!
    end
  end

  private

  attr_reader :player, :item

  def pre_initialize
    @player = context.player
    @item = context.item
  end

  def is_an_item_weared?
    player[item.slot_name] == item.id
  end

  def put_the_current_item_to_the_inventory
    player.stuffs.create(stuffable: item)
  end

  def decrease_stats
    return if item.is_a?(Tool::Item)
    Equipment::Items::RecalculateStatsService.new(player, item).decrease
  end

  def clear_slot
    player[item.slot_name] = nil
  end
end
