class Api::LocationsController < ApplicationController
  before_action :authenticate_user

  def wayward_pines
    location = Location.find_by(slug: 'wayward_pines')
    render json: location
  end
end
