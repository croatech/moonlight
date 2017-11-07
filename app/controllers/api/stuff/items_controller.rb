class Api::Stuff::ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_for_non_resource, except: :sell

  def buy
    service = Stuff::BuyService.new
    service.call(player: current_player, item: find_item) do |m|
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
      render status: 200, json: PlayerQuery.call(current_player.id)
    else
      render status: 500, json: service.error
    end
  end

  private

  def find_item
    type = case params[:item_type]
      when 'equipment' then Equipment::Item
      when 'tool' then Tool::Item
      when 'resource' then Resource
    end
    type.find(params[:item_id])
  end

  def check_for_non_resource
    return not_found if params[:item_type] == 'resource'
  end
end
