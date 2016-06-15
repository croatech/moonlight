class ProfilesController < ApplicationController

  layout 'profile'

  def show
    @profile = current_user.profile
    @items = Item::Item.where(id: @profile.inventory).decorate
  end
end
