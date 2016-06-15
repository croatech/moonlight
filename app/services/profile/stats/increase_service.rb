class Profile::Stats::IncreaseService

  attr_reader :profile, :stat

  def initialize(profile, stat)
    @profile = profile
    @stat = stat
  end

  def call
    increasing_method = "increase_#{stat}".to_sym

    if profile.free_stats > 0
      profile.public_send(increasing_method)
      decrement_free_stats
    end
  end

  private

  def decrement_free_stats
    profile.decrement!(:free_stats, 1)
  end
end