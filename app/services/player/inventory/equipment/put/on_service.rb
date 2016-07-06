class Player::Inventory::Equipment::Put::OnService

  # put on an item in a slot
  
  attr_reader :player, :equipment, :new_item, :current_item

  def initialize(player, item)
    @player = player
    @equipment = player.equipment
    @new_item = item
    @current_item = player["#{item.category.slug}_slot"]
  end

  def call
    if is_an_item_purchased? && level_required?
      put_the_current_item_in_inventory if slot_is_busy?
      put_the_new_item_from_inventory
      put_the_new_item_in_the_slot
      player.save
      #start_repair_hp
    end
  end

  private

  def is_an_item_purchased?
    equipment.include?(new_item.id)
  end

  def level_required?
    player.level >= new_item.required_level
  end

  def slot_is_busy?
    current_item.present?
  end

  def put_the_new_item_from_inventory
    player.equipment.delete(new_item.id)
  end

  def put_the_new_item_in_the_slot
    # player['weapon'] = 1
    current_item = new_item.id.to_i
  end

  def put_the_current_item_in_inventory
    player.equipment << current_item
  end

  def start_repair_hp
    service = Player::RepairHpService.new(player)
    service.call
  end
end