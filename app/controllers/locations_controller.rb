class LocationsController < ApplicationController

  before_action :authenticate_user!

  layout 'moon_light'

  def moon_light
    change_location('moon_light')
  end

  def the_elder_shop
    change_location('the_elder_shop')
  end

  def wayward_pines
    change_location('wayward_pines')
    @cells = @location.children.order(:id)
    render layout: 'map'
  end

  private

  def change_location(location_name)
    @location = Location.find_by(slug: location_name)
    Locations::ChangeLocationService.new(current_user.player, @location.id).call
  end
end
