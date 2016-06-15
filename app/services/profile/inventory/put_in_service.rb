class Profile::Inventory::PutInService

  # put in inventory item
  
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