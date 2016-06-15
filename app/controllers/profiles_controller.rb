class ProfilesController < ApplicationController

  layout 'profile'

  def show
    @profile = current_user.profile
    item_ids = Profile::Inventory::AllEquipmentService.new(current_user.profile).call
    @items = Item::Item.where(id: item_ids)
  end

  def inventory
    @profile = current_user.profile
    @items = Item::Item.where(id: @profile.inventory).decorate
    item_ids = Profile::Inventory::AllEquipmentService.new(current_user.profile).call
    @inventory_items = Item::Item.where(id: item_ids)
  end
end
