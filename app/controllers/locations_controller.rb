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
    redirect_to tool_categories_path
  end

  def shop_of_artifacts
    change_location('shop_of_artifacts')
  end

  def wayward_pines
    @location = Location.find_by(slug: 'wayward_pines')
    @cells = @location.children.order(:id).decorate
    render layout: 'map'
  end

  private

  def change_location(location_name)
    @location = Location.find_by(slug: location_name)
    
    if @location.id == current_player.location_id
      return
    else
      Location::ChangeLocationService.new(current_user.player, @location.id).call
      add_event_to_log("You\'ve changed the location to <span>#{@location.name}</span>")
    end
  end
end
