class LocationsController < ApplicationController

  before_action :authenticate_user!

  layout 'main'

  def main
    @location = location('main')
  end

  def shop
    @location = location('shop')
  end

  private

  def location(name)
    Location.find_by(slug: name)
  end
end
