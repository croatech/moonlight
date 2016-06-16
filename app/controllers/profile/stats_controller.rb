class Profile::StatsController < ApplicationController

  layout 'profile'

  def index
    @profile = current_user.profile
    item_ids = Profile::Inventory::AllEquipmentService.new(current_user.profile).call
    @inventory_items = Item::Item.where(id: item_ids)
  end

  def increase
    service = Profile::Stats::IncreaseService.new(current_user.profile, params[:stat_id])
    service.call
    redirect_to :back
  end
end
