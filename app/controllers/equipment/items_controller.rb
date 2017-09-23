class Equipment::ItemsController < ApplicationController
  def put_on
    item = Equipment::Item.find(params[:item_id])
    service = Player::Inventory::Equipment::Put::OnService.new(current_user.player, item)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def put_off
    item = Equipment::Item.find(params[:item_id])
    service = Player::Inventory::Equipment::Put::OffService.new(current_user.player, item)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def sell
    item = Equipment::Item.find(params[:item_id])
    service = Equipment::Items::SellItemService.new(current_user.player, item)
    service.call
    redirect_back(fallback_location: root_path)
  end
end
