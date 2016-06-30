class Player::Inventory::Equipment::Put::InService

  # put an item in inventory
  
  attr_reader :player, :equipment, :item

  def initialize(player, item)
    @player = player
    @equipment = player.equipment
    @item = item
  end

  def call
    equipment << item.id
    player.save
  end
end