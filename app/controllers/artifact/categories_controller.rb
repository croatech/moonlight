class Artifact::CategoriesController < ApplicationController

  layout 'moon_light'

  def index
    get_categories_list
    check_for_correct_location('shop_of_artifacts')
  end

  def show
    check_for_correct_location('shop_of_artifacts')
    get_categories_list
    @category = Equipment::Category.find_by(slug: params[:id])
    @items = @category.items.not_artifact.decorate
  end

  private

  def get_categories_list
    @categories = Equipment::Category.order(:name)
  end
end
