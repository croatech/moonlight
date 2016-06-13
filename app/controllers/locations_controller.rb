class LocationsController < ApplicationController

  before_action :authenticate_user!

  def main
    @location = Location.find_by(slug: params[:slug])
  end

  def show
    @location = Location.find_by(slug: params[:slug])
  end
end
