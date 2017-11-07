class LocationsController < ApplicationController

  before_action :authenticate_user!

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
    @location = Location.find_by(slug: 'wayward_pines')
    @cells = @location.children.order(:id).decorate
    render layout: 'map'
  end
end
