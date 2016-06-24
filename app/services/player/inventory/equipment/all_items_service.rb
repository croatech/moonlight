class Player::Inventory::Equipment::AllItemsService

  attr_reader :player

  def initialize(player)
    @player = player
  end

  def call
    item_ids = []
    
    slots.each do |slot|
      if @player["#{slot}_slot"].present?
        item_ids << @player["#{slot}_slot"]
      end
    end

    item_ids
  end

  private

  def slots
    Player::SLOTS
  end
end