class Player::Inventory::Equipment::Put::OffService

  # put off an item from a slot
  
  attr_reader :player, :equipment, :new_item, :slot

  def initialize(player, item)
    @player = player
    @equipment = player.equipment
    @new_item = item
    @slot = "#{item.category.slug}_slot"
  end

  def call
    if is_an_item_weared?
      put_an_current_item_in_inventory
      clear_slot
      player.save
    end
  end

  private

  def is_an_item_weared?
    player[slot] == new_item.id
  end

  def put_an_current_item_in_inventory
    player.equipment << new_item.id
  end

  def clear_slot
    player[slot] = nil
  end
end