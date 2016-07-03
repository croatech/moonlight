class Player::Inventory::Equipment::Put::OnAllService

  # put on all items
  
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def call
    player.equipment.each do |slot_item|
      item = Equipment::Item.find(slot_item)
      service = Player::Inventory::Equipment::Put::OnService.new(player, item)
      service.call
    end
  end
end