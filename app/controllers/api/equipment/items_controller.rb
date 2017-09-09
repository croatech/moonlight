class Api::Equipment::ItemsController < ApplicationController
  def buy
    item = Equipment::Item.find(params[:item_id])
    service = Equipment::Item::BuyItemService.new(current_user.player, item)
    service.call
  end
end
