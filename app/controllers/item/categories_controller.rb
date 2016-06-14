class Item::CategoriesController < ApplicationController

  layout 'main'

  def index
    get_categories_list
  end

  def show
    get_categories_list
    @category = Item::Category.find_by(slug: params[:id])
    @items = @category.items.decorate
  end

  private

  def get_categories_list
    @categories = Item::Category.order(:name)
  end
end
