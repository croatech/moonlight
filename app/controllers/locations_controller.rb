class LocationsController < ApplicationController

  before_action :authenticate_user!

  layout 'main'

  def main
    go_to_location('main')
  end

  def shop
    go_to_location('shop')
  end

  def mushrooms
    go_to_location('mushrooms')
    @bots = Bot::Mushroom.all
  end

  private

  def go_to_location(name)
    @location = Location.find_by(slug: name)
    Locations::ChangeLocationService.new(current_user.player, @location.id).call
  end
end
