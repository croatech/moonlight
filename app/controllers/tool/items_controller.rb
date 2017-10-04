class Tool::ItemsController < ApplicationController
  def put_on
    Equipment::Items::PutOnService.new(player: current_player, item: find_item).call
    redirect_back(fallback_location: root_path)
  end

  def take_off
    Tools::Items::TakeOffService.new(current_player, find_item).call
    redirect_back(fallback_location: root_path)
  end

  def sell
    Stuff::SellService.new(player:current_player, item: find_item).call
    redirect_back(fallback_location: root_path)
  end

  private

  def find_item
    Tool::Item.find(params[:item_id])
  end
end
