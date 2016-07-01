class Equipment::CategoriesController < ApplicationController

  layout 'moon_light'

  before_action :check_current_location

  def index
    get_categories_list
  end

  def show
    get_categories_list
    @category = Equipment::Category.find_by(slug: params[:id])
    @items = @category.items.not_artifact.decorate
  end

  private

  def get_categories_list
    @categories = Equipment::Category.order(:name)
  end

  def check_current_location
    if current_location.slug == 'weapon_shop'
      true
    else
      redirect_to root_path
    end
  end
end
