class Equipment::Item::BuyService
  include Dry::Transaction

  step :init
  step :gold_enough?
  step :level_enough?
  step :buy

  def init(input)
    @player = input[:player]
    @item = input[:item]
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
    ActivRecord::Base.transaction do
      put_an_item_to_the_inventory
      withdraw_money
      player.save
      Right(nil)
    end
  end

  private

  attr_reader :player, :item

  def put_an_item_to_the_inventory
    player.equipment << item.id
  end

  def withdraw_money
    player.decrement(:gold, item.price)
  end
end
