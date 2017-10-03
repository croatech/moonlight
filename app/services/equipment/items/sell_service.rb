class Equipment::Items::SellService
  include Interactor

  def call
    pre_initialize

    if player_has_an_item?
      ActiveRecord::Base.transaction do
        delete_an_item_from_an_inventory
        deposite_money
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

  def player_has_an_item?
    player.equipment_items.include?(item)
  end

  def delete_an_item_from_an_inventory
    player.stuff_item(item).delete
  end

  def deposite_money
    player.increment!(:gold, item.sell_price)
  end
end
