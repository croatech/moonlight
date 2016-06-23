class Tool::CategoriesController < ApplicationController
  
  layout 'moon_light'
  
  before_action :check_current_location

  def index
    get_categories_list
  end

  def show
    get_categories_list
    @category = Tool::Category.find_by(slug: params[:id])
    @items = @category.items.decorate
  end

  private

  def get_categories_list
    @categories = Tool::Category.order(:name)
  end

  def check_current_location
    if current_location.slug == 'craft_shop'
      true
    else
      redirect_to root_path
    end
  end
end
