class Artifact::CategoriesController < ApplicationController

  layout 'moon_light'

  def index
    get_categories_list
    check_for_correct_location('shop_of_artifacts')
  end

  def show
    check_for_correct_location('shop_of_artifacts')
    get_categories_list
    @items = Equipment::Item.artifacts.where("name LIKE ?", "%#{params[:id]}%").decorate
  end

  private

  def get_categories_list
    @categories = Equipment::Category::ARTIFACT_CATEGORIES
  end
end
