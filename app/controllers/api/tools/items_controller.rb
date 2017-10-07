class Api::Tools::ItemsController < ApplicationController
  before_action :authenticate_user!

  def buy
    item = Tool::Item.find(params[:item_id])
    service = Stuff::BuyService.new
    service.call(player: current_player, item: item) do |m|
      m.success do |item|
        render json: item, status: 200
      end

      m.failure do |errors|
        render json: errors, status: 500
      end
    end
  end

  def put_on
    service = Stuff::PutOnService.call(player: current_player, item: find_item)
    if service.success?
      render status: 200, json: PlayerQuery.call(current_player.id)
    else
      render status: 500, body: nil
    end
  end

  def sell
    Stuff::SellService.call(player: current_player, item: find_item)
    redirect_back(fallback_location: root_path)
  end

  private

  def find_item
    Tool::Item.find(params[:item_id])
  end
end
