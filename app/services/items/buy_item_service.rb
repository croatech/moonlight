class Items::BuyItemService
  
  attr_reader :item, :character

  def initialize(item, character)
    @item = item
    @character =  character
  end

  def call
    if is_money_enough?
      withdraw_money if put_item_in_inventory
    end
  end

  private

  def is_money_enough?
    true if character.cash >= item.cost
  end

  def withdraw_money 
    character.decrement!(:cash, item.cost)
  end

  def put_item_in_inventory
    Inventory::PutInService.new(character, item).call
  end
end 