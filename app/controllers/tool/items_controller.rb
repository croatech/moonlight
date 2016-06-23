class Tool::ItemsController < ApplicationController

  def buy
    item = Tool::Item.find(params[:item_id])
    service = Tool::Item::BuyItemService.new(current_user.player, item)

    if service.call
      redirect_to :back
      flash[:notice] = "You have bought the #{item.name}"
    else
      redirect_to :back
      flash[:danger] = 'Not enough gold'
    end 
  end

  def sell
    item = Tool::Item.find(params[:item_id])
    service = Tool::Item::SellItemService.new(current_user.player, item)
    service.call
    redirect_to :back
  end  
end
