class Artifact::CategoriesController < ApplicationController
  layout 'moon_light'

  def index
    check_for_correct_location('shop_of_artifacts')
  end
end
