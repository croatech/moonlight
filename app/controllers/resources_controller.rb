class ResourcesController < ApplicationController

  def collect
    resource = Resource.find(params[:resource_id])
  end
end
