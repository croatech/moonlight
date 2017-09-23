class Tools::Items::PutOnService
  attr_reader :player, :tools, :item, :slot_name

  def initialize(player, item)
    @player = player
    @tools = player.tools
    @item = item
    @slot_name = "#{item.type}_slot"
  end

  def call
    if is_an_item_purchased? && is_skill_correct?
      put_an_old_item_in_inventory if slot_is_busy?
      delete_a_new_item_from_inventory
      put_a_new_item_in_a_slot
      player.save
    end
  end

  private

  def is_an_item_purchased?
    tools.include?(item.id.to_s)
  end

  def is_skill_correct?
    player.public_send("#{item.type}_skill") >= item.required_skill
  end

  def slot_is_busy?
    player[slot_name].present?
  end

  def delete_a_new_item_from_inventory
    tools.delete(item.id.to_s)
  end

  def put_a_new_item_in_a_slot
    player[slot_name] = item.id.to_i
  end

  def put_an_old_item_in_inventory
    tools << player[slot_name]
  end
end