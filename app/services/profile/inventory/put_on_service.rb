class Profile::Inventory::PutOnService

  # put on(wear) an item
  
  attr_reader :profile, :inventory, :item, :item_id, :item_type

  def initialize(profile, item)
    @profile = profile
    @inventory = profile.inventory
    @item = item
    @item_id = item.id.to_s
    @item_type = item.category.slug
  end

  def call
    if is_an_item_purchased? && level_required?
      put_an_old_item_in_inventory if slot_is_busy?
      delete_a_new_item_from_inventory
      put_a_newitem_in_a_slot
      profile.save
    end
  end

  private

  def is_an_item_purchased?
    true if inventory.include?(item_id)
  end

  def level_required?
    true if profile.level >= item.level
  end

  def slot_is_busy?
    true if profile[item_type].present?
  end

  def delete_a_new_item_from_inventory
    profile.inventory.delete(item_id)
  end

  def put_a_newitem_in_a_slot
    # profile['weapon'] = 1
    profile[item_type] = item_id.to_i
  end

  def put_an_old_item_in_inventory
    profile.inventory << profile[item_type]
  end
end