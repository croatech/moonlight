class Api::Equipment::ItemsController < ApplicationController
  def buy
    item = ::Equipment::Item.find(params[:item_id])
    service = ::Equipment::Item::BuyService.new(current_player, item).call
    service
  end
end

