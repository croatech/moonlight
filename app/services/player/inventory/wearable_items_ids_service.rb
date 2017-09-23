class Player::Inventory::WearableItemsIdsService
  attr_reader :player, :slots

  def initialize(player, slots)
    @player = player
    @slots = slots
  end

  def call
    items_ids = []

    slots.each do |slot|
      if @player["#{slot}_slot"].present?
        items_ids << @player["#{slot}_slot"]
      end
    end

    items_ids
  end
end
