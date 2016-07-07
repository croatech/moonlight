class Player::Inventory::Equipment::Put::OnService

  # put on an item in a slot
  
  attr_reader :player, :equipment, :new_item, :current_item, :slot

  def initialize(player, item)
    @player = player
    @equipment = player.equipment
    @new_item = item
    @slot = "#{item.category.slug}_slot"
    @current_item = player[slot]
  end

  def call
    if is_an_item_purchased? && level_required?
      put_the_current_item_in_inventory if slot_is_busy?
      put_the_new_item_in_the_slot
      player.save
      start_restore_hp
    end
  end

  private

  def is_an_item_purchased?
    equipment.include?(new_item.id.to_s)
  end

  def level_required?
    player.level >= new_item.required_level
  end

  def slot_is_busy?
    current_item.present?
  end

  def put_the_new_item_in_the_slot
    equipment.delete(new_item.id.to_s)
    player[slot] = new_item.id.to_i
  end

  def put_the_current_item_in_inventory
    equipment << current_item.to_s
  end

  def start_restore_hp
    service = Player::RestoreHpService.new(player)
    service.call
  end
end