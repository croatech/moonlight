class Player::Inventory::Put::InService

  # put an item in inventory
  
  attr_reader :player, :inventory, :item

  def initialize(player, item)
    @player = player
    @inventory = player.inventory
    @item = item
  end

  def call
    inventory << item.id
    player.save
  end
end