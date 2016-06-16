class Profile::Inventory::PutOffService

  # put on(wear) an item
  
  attr_reader :profile, :inventory, :item, :item_id, :item_type

  def initialize(profile, item)
    @profile = profile
    @inventory = profile.inventory
    @item = item
    @item_id = item.id
    @item_type = item.category.slug
  end

  def call
    if is_an_item_weared?
      put_an_old_item_in_inventory
      clear_slot
      profile.save
    end
  end

  private

  def is_an_item_weared?
    true if profile[item_type] == item_id
  end

  def put_an_old_item_in_inventory
    profile.inventory << item_id
  end

  def clear_slot
    profile[item_type] = nil
  end
end