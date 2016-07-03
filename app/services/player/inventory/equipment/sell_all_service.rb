class Player::Inventory::Equipment::SellAllService

  attr_reader :player

  def initialize(player)
    @player = player
  end

  def call
    player.equipment.each do |slot_item|
      item = Equipment::Item.find(slot_item)
      service = Equipment::Item::SellItemService.new(player, item)
      service.call
    end
  end
end