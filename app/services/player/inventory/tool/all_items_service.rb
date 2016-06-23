class Player::Inventory::Tool::AllItemsService

  attr_reader :player

  def initialize(player)
    @player = player
  end

  def call
    item_ids = []
    
    slots.each do |slot_name|
      if @player["#{slot_name}_slot"].present?
        item_ids << @player["#{slot_name}_slot"]
      end
    end

    item_ids
  end

  private

  def slots
    Player.const_get("CRAFT")
  end
end