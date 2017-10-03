class Tools::Items::BuyService
  include Dry::Transaction

  step :init
  step :gold_enough?
  step :skill_enough?
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

  def skill_enough?(_input)
    if player_skill_level >= item.required_skill
      Right(nil)
    else
      Left('Skill is not enough')
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
    player.tool_items << item
  end

  def withdraw_gold
    player.decrement!(:gold, item.price)
  end

  def player_skill_level
    # Sends message to player.*_skill where * is type of item
    # For example if item type is fishing it executes player.fishing_skill
    player.send("#{item.type}_skill")
  end
end
