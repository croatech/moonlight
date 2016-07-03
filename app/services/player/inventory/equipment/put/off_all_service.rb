class Player::Inventory::Equipment::Put::OffAllService

  # put off all items
  
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def call
    Player::EQUIPMENT_SLOTS.each do |slot|
      slot_name = "#{slot}_slot"
      # if item is weared
      if player[slot_name].present?
        item = Equipment::Item.find(player[slot_name])
        service = Player::Inventory::Equipment::Put::OffService.new(player, item)
        service.call
      end
    end
  end
end