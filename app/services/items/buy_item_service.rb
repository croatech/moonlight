class Items::BuyItemService
  
  attr_reader :item, :player

  def initialize(item, player)
    @item = item
    @player =  player
  end

  def call
    if is_money_enough?
      withdraw_money if put_item_in_inventory
    end
  end

  private

  def is_money_enough?
    true if player.gold >= item.price
  end

  def withdraw_money 
    player.decrement!(:gold, item.price)
  end

  def put_item_in_inventory
    Player::Inventory::Put::InService.new(player, item).call
  end
end 