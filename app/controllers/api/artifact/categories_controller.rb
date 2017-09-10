class Api::Artifact::CategoriesController < ApplicationController
  def index
    render json: ::Equipment::Category.includes(:items).where(equipment_items: { artifact: true })
  end
end
