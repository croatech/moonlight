class Api::Equipment::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: ::Equipment::Category.includes(:items).where(equipment_items: { artifact: false })
  end
end
