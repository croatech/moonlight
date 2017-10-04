class Equipment::ItemsController < ApplicationController
  def put_on
    Stuff::PutOnService.new(player: current_player, item: find_item).call
    redirect_back(fallback_location: root_path)
  end

  def take_off
    Stuff::TakeOffService.new(player: current_user.player, item: find_item).call
    redirect_back(fallback_location: root_path)
  end

  def sell
    Stuff::SellService.call(player: current_player, item: find_item)
    redirect_back(fallback_location: root_path)
  end

  private

  def find_item
    Equipment::Item.find(params[:item_id])
  end
end
