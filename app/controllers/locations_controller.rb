class LocationsController < ApplicationController

  before_action :authenticate_user!

  layout 'moon_light', only: [:moon_light, :the_elder_shop, :mushrooms]
  layout 'map', only: :wayward_pines

  def moon_light
    go_to_location('moon_light')
  end

  def the_elder_shop
    go_to_location('the_elder_shop')
  end

  def mushrooms
    go_to_location('mushrooms')
    @bots = Bot::Mushroom.all
  end

  def wayward_pines
    go_to_location('wayward_pines')
    @cells = @location.children.order(:id)
  end

  private

  def go_to_location(name)
    @location = Location.find_by(slug: name)
    Locations::ChangeLocationService.new(current_user.player, @location.id).call
  end
end
