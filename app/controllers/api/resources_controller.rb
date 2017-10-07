class Api::ResourcesController < ApplicationController
  before_action :authenticate_user!

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
    Resource.find(params[:resource_id])
  end
end
