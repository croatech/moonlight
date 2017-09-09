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
    service = Equipment::Item::SellItemService.new(current_user.player, item)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def put_on_all
    service = Player::Inventory::Equipment::Put::OnAllService.new(current_user.player)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def put_off_all
    service = Player::Inventory::Equipment::Put::OffAllService.new(current_user.player)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def sell_all
    service = Player::Inventory::Equipment::SellAllService.new(current_user.player)
    service.call
    redirect_back(fallback_location: root_path)
  end
end
