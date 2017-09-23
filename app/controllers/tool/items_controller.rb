class Tool::ItemsController < ApplicationController
  def put_on
    item = Tool::Item.find(params[:item_id])
    service = Player::Inventory::Tool::Put::OnService.new(current_user.player, item)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def put_off
    item = Tool::Item.find(params[:item_id])
    service = Player::Inventory::Tool::Put::OffService.new(current_user.player, item)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def sell
    item = Tool::Item.find(params[:item_id])
    service = Tools::Items::SellItemService.new(current_user.player, item)
    service.call
    redirect_back(fallback_location: root_path)
  end
end
