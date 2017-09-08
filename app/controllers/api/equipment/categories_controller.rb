class Api::Equipment::CategoriesController < ApplicationController
  def index
    check_for_correct_location('weapon_shop')
    render json: ::Equipment::Category.includes(:items)
  end
end
