class Player::Inventory::Equipment::Put::OnService

  # put on an item in a slot
  
  attr_reader :player, :equipment, :item, :item_id, :item_type

  def initialize(player, item)
    @player = player
    @equipment = player.equipment
    @item = item
    @item_id = item.id.to_s
    @item_type = "#{item.category.slug}_slot"
  end

  def call
    if is_an_item_purchased? && level_required?
      put_an_old_item_in_inventory if slot_is_busy?
      delete_a_new_item_from_inventory
      put_a_new_item_in_a_slot
      update_stats
      player.save
    end
  end

  private

  def is_an_item_purchased?
    equipment.include?(item_id)
  end

  def level_required?
    player.level >= item.required_level
  end

  def slot_is_busy?
    player[item_type].present?
  end

  def delete_a_new_item_from_inventory
    player.equipment.delete(item_id)
  end

  def put_a_new_item_in_a_slot
    # player['weapon'] = 1
    player[item_type] = item_id.to_i
  end

  def put_an_old_item_in_inventory
    player.equipment << player[item_type]
  end

  def update_stats
    Player::STATS.each do |stat_name|
      player.increment(stat_name.to_sym, item[stat_name])
    end
  end
end