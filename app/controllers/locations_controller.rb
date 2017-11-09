class LocationsController < ApplicationController

  before_action :authenticate_user!
  before_action :go_to_city_if_outside, except: :wayward_pines

  layout 'moon_light'

  def moon_light
    change_location('Moon Light')
  end

  def weapon_shop
    change_location('Weapon Shop')
  end

  def craft_shop
    change_location('Craft Shop')
  end

  def shop_of_artifacts
    change_location('Shop of Artifacts')
  end

  def wayward_pines
    change_location(Location::START_LOCATION_NAME) if current_location.in_city?
    @location = Location.find_by(slug: 'wayward_pines')
    @cells = @location.children.order(:id).decorate
    render layout: 'map'
  end

  private

  def go_to_city_if_outside
    return if current_location.name == Location::START_LOCATION_NAME || current_location.in_city?
    change_cell('Shady Walk')
    redirect_back(fallback_location: root_path)
  end
end
