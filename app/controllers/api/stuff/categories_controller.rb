class Api::Stuff::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: determine_relation
  end

  private

  def determine_relation
    case params[:category_type]
      when 'equipment' then ::Equipment::Category.includes(:items).where(equipment_items: { artifact: false })
      when 'artifacts' then ::Equipment::Category.includes(:items).where(equipment_items: { artifact: true })
      when 'tool' then Tool::Category.includes(:items)
    end
  end
end
