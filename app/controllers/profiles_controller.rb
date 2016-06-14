class ProfilesController < ApplicationController

  layout 'profile'

  def show
    @profile = current_user.character
    @items = Item::Item.where(id: @profile.inventory).decorate
  end

  def stats
    @character = current_user.character
  end

  def inventory
  end
end
