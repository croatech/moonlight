class Api::Equipment::CategoriesController < ApplicationController
  def index
    render json: ::Equipment::Category.includes(:items).where(equipment_items: { artifact: false }).order(:name)
  end
end
