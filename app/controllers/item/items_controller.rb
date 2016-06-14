class Item::ItemsController < ApplicationController

  def buy
    item = Item::Item.find(params[:item_id])
    service = Items::BuyItemService.new(item, current_user.character)

    if service.call
      redirect_to :back
      flash[:notice] = "You have bought the #{item.name}"
    else
      redirect_to :back
      flash[:danger] = 'Not enough gold'
    end 
  end
end
