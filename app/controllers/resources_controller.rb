class ResourcesController < ApplicationController

  def collect
    resource = Resource.find(params[:resource_id])
    service = Resource::CollectService.new(current_user.player, resource)
    service.call
    log("You've successfully chopped <span>#{resource.name}</span>. Your #{resource.type} skill is <span>#{current_user.player.decorate.current_skill(resource)}</span>.")
    redirect_to :back
  end

  def sell_all
    service = Resource::SellAllService.new(current_user.player)
    service.call
    redirect_to :back
  end
end
