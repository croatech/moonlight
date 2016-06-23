class Tool::Item::BuyItemService
  
  attr_reader :player, :item

  def initialize(player, item)
    @player =  player
    @item = item
  end

  def call
    if is_money_enough?
      withdraw_money if put_item_in_inventory
    end
  end

  private

  def is_money_enough?
    player.gold >= item.price
  end

  def withdraw_money 
    player.decrement!(:gold, item.price)
  end

  def put_item_in_inventory
    player.tools << item.id
  end

  def is_skill_correct?
    player.public_send("#{item.type}_skill") >= item.required_skill
  end
end 