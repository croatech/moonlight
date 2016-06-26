class ResourcesController < ApplicationController

  def collect
    resource = Resource.find(params[:resource_id])
    service = Resource::CollectService.new(current_user.player, resource)

    if service.call
      log("You've successfully chopped <span>#{resource.name}</span>")
      redirect_to :back
    end
  end
end
