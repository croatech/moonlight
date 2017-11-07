class Stuff::SellService
  include Interactor

  def call
    pre_initialize

    check_for_correct_location

    if player_has_an_item?
      ActiveRecord::Base.transaction do
        delete_an_item_from_an_inventory
        deposite_money
      end
    else
      context.fail!
    end
  end

  private

  attr_reader :player, :item

  def pre_initialize
    @player = context.player
    @item = context.item
  end

  def check_for_correct_location
    service = Locations::CheckForShopLocation.call(player: player)
    context.fail!(error: service.error) if service.failure?
  end

  def player_has_an_item?
    player.has_an_item?(item)
  end

  def delete_an_item_from_an_inventory
    player.stuff_item(item).delete
  end

  def deposite_money
    player.increment!(:gold, item.sell_price)
  end
end
