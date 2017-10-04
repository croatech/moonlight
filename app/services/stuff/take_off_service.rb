class Stuff::TakeOffService
  include Interactor

  def call
    pre_initialize

    if is_an_item_weared?
      ActiveRecord::Base.transaction do
        put_the_current_item_to_the_inventory
        update_hp
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

  def update_hp
    return unless item.is_a?(Equipment::Item)
    player.current_hp = player.current_hp - item.hp
  end

  def clear_slot
    player[item.slot_name] = nil
  end
end
