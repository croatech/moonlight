class ProfilesController < ApplicationController

  layout 'main'

  def show
    @profile = Character.find_by(name: params[:name])
    @items = Item::Item.where(id: @profile.inventory).decorate
  end
end
