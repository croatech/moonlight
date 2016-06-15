class Profile::StatsController < ApplicationController

  layout 'profile'

  def index
    @profile = current_user.profile
    get_equipment
  end

  def increase
    service = Profile::Stats::IncreaseService.new(current_user.profile, params[:stat_id])
    service.call
    redirect_to :back
  end
end
