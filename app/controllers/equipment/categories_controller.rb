class Equipment::CategoriesController < ApplicationController

  layout 'moon_light'

  def index
    check_for_correct_location('weapon_shop')
  end
end
