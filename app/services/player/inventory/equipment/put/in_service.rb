class Player::Inventory::Equipment::Put::InService

  # put an item in inventory
  
  attr_reader :player, :item

  def initialize(player, item)
    @player = player
    @item = item
  end

  def call
    player.equipment << item.id
    player.save
  end
end