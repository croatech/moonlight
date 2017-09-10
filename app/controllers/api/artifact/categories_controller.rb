class Api::Artifact::CategoriesController < ApplicationController
  def index
    render json: ::Equipment::Category.artifact.includes(:items)
  end
end
