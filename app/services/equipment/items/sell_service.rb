class Equipment::Items::SellService
  include Interactor

  def call
    pre_initialize

    if player_has_an_item?
      delete_an_item_from_an_inventory
      deposite_money
      player.save
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
    player.equipment.include?(item.id.to_s)
  end

  def deposite_money 
    player.increment(:gold, item.sell_price)
  end

  def delete_an_item_from_an_inventory
    player.equipment.delete(item.id.to_s)
  end
end
