class Api::Equipment::ItemsController < ApplicationController
  before_action :authenticate_user!

  def buy
    item = ::Equipment::Item.find(params[:item_id])
    service = ::Equipment::Item::BuyService.new
    service.call(player: current_player, item: item) do |m|
      m.success do |item|
        render json: item, status: 200
      end

      m.failure do |errors|
        render json: errors, status: 500
      end
    end
  end
end
