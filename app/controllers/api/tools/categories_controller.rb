class Api::Tools::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Tool::Category.includes(:items), each_serializer: Tool::CategorySerializer
  end
end
