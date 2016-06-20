class Equipment::ItemsController < ApplicationController

  def buy
    item = Equipment::Item.find(params[:item_id])
    service = Items::BuyItemService.new(item, current_user.player)

    if service.call
      redirect_to :back
      flash[:notice] = "You have bought the #{item.name}"
    else
      redirect_to :back
      flash[:danger] = 'Not enough gold'
    end 
  end

  def put_on
    item = Equipment::Item.find(params[:item_id])
    service = Player::Inventory::Put::OnService.new(current_user.player, item)
    service.call
    redirect_to :back
  end

  def put_off
    item = Equipment::Item.find(params[:item_id])
    service = Player::Inventory::Put::OffService.new(current_user.player, item)
    service.call
    redirect_to :back
  end
end
