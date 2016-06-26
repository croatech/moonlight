class LocationsController < ApplicationController

  before_action :authenticate_user!

  layout 'moon_light'

  def moon_light
    change_location('moon_light')
  end

  def weapon_shop
    change_location('weapon_shop')
  end

  def craft_shop
    change_location('craft_shop')
  end

  def wayward_pines
    change_location('wayward_pines')
    @cells = @location.children.order(:id)
    render layout: 'map'
  end

  private

  def change_location(location_name)
    @location = Location.find_by(slug: location_name)
    Location::ChangeLocationService.new(current_user.player, @location.id).call
    log("You\'ve changed the location to <span>#{@location.name}</span>")
  end
end
