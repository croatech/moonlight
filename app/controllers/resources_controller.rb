class ResourcesController < ApplicationController
  def collect
    service = Resource::CollectService.new(current_user.player, find_item)
    service.call
    add_event_to_log("You've successfully chopped <span>#{resource.name}</span>. Your #{resource.type} skill is <span>#{current_user.player.decorate.current_skill(resource)}</span>.")
    redirect_back(fallback_location: root_path)
  end

  def sell
    service = Stuff::SellService.call(player: current_player, item: find_item)
    service.call
    redirect_back(fallback_location: root_path)
  end

  private

  def find_item
    Resource.find(params[:resource_id])
  end
end
