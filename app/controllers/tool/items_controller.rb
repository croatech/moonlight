class Tool::ItemsController < ApplicationController

  def buy
    item = Tool::Item.find(params[:item_id])
    service = Tool::Item::BuyItemService.new(current_user.player, item)
    service.call
    redirect_to :back
  end

  def put_on
    item = Tool::Item.find(params[:item_id])
    service = Player::Inventory::Tool::Put::OnService.new(current_user.player, item)
    service.call
    redirect_to :back
  end

  def put_off
    item = Tool::Item.find(params[:item_id])
    service = Player::Inventory::Tool::Put::OffService.new(current_user.player, item)
    service.call
    redirect_to :back
  end

  def sell
    item = Tool::Item.find(params[:item_id])
    service = Tool::Item::SellItemService.new(current_user.player, item)
    service.call
    redirect_to :back
  end  
end
