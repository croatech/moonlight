class Equipment::CategoriesController < ApplicationController

  layout 'moon_light'

  def index
    get_categories_list
  end

  def show
    get_categories_list
    @category = Equipment::Category.find_by(slug: params[:id])
    @items = @category.items.decorate
  end

  private

  def get_categories_list
    @categories = Equipment::Category.order(:name)
  end
end
