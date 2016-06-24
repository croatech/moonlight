class Tool::Item::BuyItemService
  
  attr_reader :player, :item

  def initialize(player, item)
    @player =  player
    @item = item
  end

  def call
    if is_money_enough?
      withdraw_money
      put_item_in_inventory
      player.save
    end
  end

  private

  def is_money_enough?
    player.gold >= item.price
  end

  def withdraw_money 
    player.decrement(:gold, item.price)
  end

  def put_item_in_inventory
    player.tools << item.id
  end
end 