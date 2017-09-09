class Api::Equipment::CategoriesController < ApplicationController
  def index
    render json: ::Equipment::Category.includes(:items)
  end
end
