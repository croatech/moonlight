class LocationsController < ApplicationController

  before_action :authenticate_user!

  layout 'main'

  def main
    go_to_location('main')
  end

  def shop
    go_to_location('shop')
  end

  private

  def go_to_location(name)
    @location = Location.find_by(slug: name)
    Locations::ChangeLocationService.new(current_user.profile, @location.id).call
  end
end
