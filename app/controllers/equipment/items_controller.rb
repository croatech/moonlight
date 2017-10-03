class Equipment::ItemsController < ApplicationController
  def put_on
    service = Equipment::Items::PutOnService.new(current_user.player, find_item)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def take_off
    service = Equipment::Items::TakeOffService.new(current_user.player, find_item)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def sell
    Equipment::Items::SellService.call(player: current_player, item: find_item)
    redirect_back(fallback_location: root_path)
  end

  private

  def find_item
    Equipment::Item.find(params[:item_id])
  end
end
