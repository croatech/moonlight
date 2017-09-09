class Api::Equipment::ItemsController < ApplicationController
  def buy
    item = ::Equipment::Item.find(params[:item_id])
    service = ::Equipment::Item::BuyService.new.call(player: current_player, item: item)
    if service.success?
      render json: "Wise choice! You bought the #{item.name}", status: 200
    else
      render json: service.errors, status: 500
    end
  end
end
