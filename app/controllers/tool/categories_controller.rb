class Tool::CategoriesController < ApplicationController
  
  layout 'moon_light'

  def index
    check_for_correct_location('craft_shop')
    get_categories_list
  end

  def show
    check_for_correct_location('craft_shop')
    get_categories_list
    @category = Tool::Category.find_by(slug: params[:id])
    @items = @category.items.decorate
  end

  private

  def get_categories_list
    @categories = Tool::Category.order(:name)
  end
end
