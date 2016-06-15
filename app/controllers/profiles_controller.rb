class ProfilesController < ApplicationController

  layout 'profile'

  def show
    @profile = current_user.profile
    get_equipment
  end

  def inventory
    @profile = current_user.profile
    @items = Item::Item.where(id: @profile.inventory).decorate
    get_equipment
  end
end
