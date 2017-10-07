class Tool::ItemsController < ApplicationController
  def take_off
    Stuff::TakeOffService.call(player: current_player, item: find_item)
    redirect_back(fallback_location: root_path)
  end

  private

  def find_item
    Tool::Item.find(params[:item_id])
  end
end
