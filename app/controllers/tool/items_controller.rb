class Tool::ItemsController < ApplicationController
  def put_on
    item = Tool::Item.find(params[:item_id])
    service = Tools::Items::PutOnService.new(current_user.player, item)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def take_off
    item = Tool::Item.find(params[:item_id])
    service = Tools::Items::TakeOffService.new(current_user.player, item)
    service.call
    redirect_back(fallback_location: root_path)
  end

  def sell
    item = Tool::Item.find(params[:item_id])
    service = Tools::Items::SellService.new(current_user.player, item)
    service.call
    redirect_back(fallback_location: root_path)
  end
end
