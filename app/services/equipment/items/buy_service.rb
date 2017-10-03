class Equipment::Items::BuyService
  include Dry::Transaction

  step :init
  step :gold_enough?
  step :level_enough?
  step :buy

  def init(input)
    @player = input[:player]
    @item = input[:item]

    Right(nil)
  end

  def gold_enough?(_input)
    if player.gold >= item.price
      Right(nil)
    else
      Left('Gold is not enough')
    end
  end

  def level_enough?(_input)
    if player.level >= item.required_level
      Right(nil)
    else
      Left('Level is not enough')
    end
  end

  def buy(_input)
    ActiveRecord::Base.transaction do
      put_an_item_to_the_inventory
      withdraw_gold
    end

    Right(item)
  end

  private

  attr_reader :player, :item

  def put_an_item_to_the_inventory
    player.equipment_items << item
  end

  def withdraw_gold
    player.decrement!(:gold, item.price)
  end
end
