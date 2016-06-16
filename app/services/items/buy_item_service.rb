class Items::BuyItemService
  
  attr_reader :item, :profile

  def initialize(item, profile)
    @item = item
    @profile =  profile
  end

  def call
    if is_money_enough?
      withdraw_money if put_item_in_inventory
    end
  end

  private

  def is_money_enough?
    true if profile.gold >= item.cost
  end

  def withdraw_money 
    profile.decrement!(:gold, item.cost)
  end

  def put_item_in_inventory
    Profile::Inventory::Put::InService.new(profile, item).call
  end
end 