class Api::Tools::CategoriesController < ApplicationController
  def index
    render json: Tool::Category.includes(:items), each_serializer: Tool::CategorySerializer
  end
end
