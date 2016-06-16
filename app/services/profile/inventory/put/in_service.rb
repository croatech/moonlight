class Profile::Inventory::Put::InService

  # put an item in inventory
  
  attr_reader :profile, :inventory, :item

  def initialize(profile, item)
    @profile = profile
    @inventory = profile.inventory
    @item = item
  end

  def call
    inventory << item.id
    profile.save
  end
end