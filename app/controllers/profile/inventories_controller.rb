class Profile::InventoriesController < ApplicationController

  layout 'profile'

  def show
    @profile = current_user.profile
    @items = Item::Item.where(id: @profile.inventory).decorate
    get_equipment
  end
end