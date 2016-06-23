class Player::Inventory::Tool::Put::OffService

  # put off an item from a slot
  
  attr_reader :player, :tools, :item, :slot_name

  def initialize(player, item)
    @player = player
    @tools = player.tools
    @item = item
    @slot_name = "#{item.type}_slot"
  end

  def call
    if is_an_item_wear?
      put_an_old_item_in_inventory
      clear_slot
      player.save
    end
  end

  private

  def is_an_item_wear?
    player[slot_name] == item.id
  end

  def put_an_old_item_in_inventory
    tools << item.id
  end

  def clear_slot
    player[slot_name] = nil
  end
end