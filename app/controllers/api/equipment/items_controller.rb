class Api::Equipment::ItemsController < ApplicationController
  before_action :authenticate_user!

  def buy
    item = Equipment::Item.find(params[:item_id])
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

  def take_off
    service = Stuff::TakeOffService.call(player: current_player, item: find_item)
    if service.success?
      render status: 200, json: PlayerQuery.call(current_player.id)
    else
      render status: 500, body: nil
    end
  end

  def sell
    service = Stuff::SellService.call(player: current_player, item: find_item)
    if service.success?
      render status: 200, body: nil
    else
      render status: 500, body: nil
    end
  end

  private

  def find_item
    Equipment::Item.find(params[:item_id])
  end
end
