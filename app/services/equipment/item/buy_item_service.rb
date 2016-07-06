class Equipment::Item::BuyItemService
  
  attr_reader :player, :item

  def initialize(player, item)
    @player =  player
    @item = item
  end

  def call
    if is_money_enough? && level_required?
      put_an_item_in_the_inventory if withdraw_money
      player.save
    end
  end

  private

  def is_money_enough?
    player.gold >= item.price
  end

  def level_required?
    player.level >= item.required_level
  end

  def put_an_item_in_the_inventory
    player.equipment << item.id
  end

  def withdraw_money 
    player.decrement(:gold, item.price)
  end
end 