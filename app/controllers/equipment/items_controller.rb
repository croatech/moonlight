class Equipment::ItemsController < ApplicationController

  def buy
    item = Equipment::Item.find(params[:item_id])
    service = Equipment::Item::BuyItemService.new(current_user.player, item)
    service.call
    redirect_to :back
  end

  def put_on
    item = Equipment::Item.find(params[:item_id])
    service = Player::Inventory::Equipment::Put::OnService.new(current_user.player, item)
    service.call
    redirect_to :back
  end

  def put_off
    item = Equipment::Item.find(params[:item_id])
    service = Player::Inventory::Equipment::Put::OffService.new(current_user.player, item)
    service.call
    redirect_to :back
  end

  def sell
    item = Equipment::Item.find(params[:item_id])
    service = Equipment::Item::SellItemService.new(current_user.player, item)
    service.call
    redirect_to :back
  end
end
