class Equipment::Item::BuyItemService
  
  attr_reader :player, :item

  def initialize(player, item)
    @player =  player
    @item = item
  end

  def call
    if is_money_enough?
      withdraw_money if put_item_in_inventory
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
    Player::Inventory::Equipment::Put::InService.new(player, item).call
  end
end 