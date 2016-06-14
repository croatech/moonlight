class Inventory::PutInService

  attr_reader :character, :inventory, :item

  def initialize(character, item)
    @character = character
    @inventory = character.inventory
    @item = item
  end

  def call
    # if duplicate
    unless inventory.include?(item.id.to_s)
      inventory << item.id
      character.save
    end
  end
end