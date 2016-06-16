class Locations::ChangeLocationService

  attr_reader :profile, :location_id

  def initialize(profile, location_id)
    @profile = profile
    @location_id = location_id
  end

  def call
    profile.location_id = location_id
    profile.save
  end
end