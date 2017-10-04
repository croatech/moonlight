class Equipment::Items::TakeOffService
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
      update_hp
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

  def update_hp
    current_hp = player.current_hp  full_hp = player.hp
    player.current_hp = full_hp - new_item.hp if current_hp > full_hp
  end

  def clear_slot
    player[slot] = nil
  end
end