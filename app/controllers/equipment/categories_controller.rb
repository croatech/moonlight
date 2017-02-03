class Equipment::CategoriesController < ApplicationController

  layout 'moon_light'

  def index
    check_for_correct_location('weapon_shop')
    get_categories_list
  end

  def show
    check_for_correct_location('weapon_shop')
    get_categories_list
    @category = Equipment::Category.find_by(slug: params[:id])
    @items = @category.items.not_artifact.decorate
  end

  private

  def get_categories_list
    @categories = Equipment::Category::CategoriesService.all
  end
end
