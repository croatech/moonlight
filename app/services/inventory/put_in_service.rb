class Inventory::PutInService

  attr_reader :profile, :inventory, :item

  def initialize(profile, item)
    @profile = profile
    @inventory = profile.inventory
    @item = item
  end

  def call
    # if duplicate
    unless inventory.include?(item.id.to_s)
      inventory << item.id
      profile.save
    end
  end
end