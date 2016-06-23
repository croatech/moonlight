class Player::Inventory::Equipment::AllItemsService

  attr_reader :player

  def initialize(player)
    @player = player
  end

  def call
    item_ids = []
    
    slots.each do |slot_name|
      if @player[slot_name].present?
        item_ids << @player[slot_name]
      end
    end

    item_ids
  end

  private

  def slots
    Player.const_get("SLOTS")
  end
end