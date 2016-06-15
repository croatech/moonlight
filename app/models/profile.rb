class Profile < ActiveRecord::Base
  
  belongs_to :location
  belongs_to :user

  # generate methods for increasing of stats
  STATS = ['attack', 'defense', 'hp']

  STATS.each do |stat|
    stat_name = stat.to_sym
    method_name = "increase_#{stat}".to_sym

    define_method(method_name) do
      self.increment!(stat_name, 4) if stat_name == :hp
      self.increment!(stat_name, 1)
    end
  end
end
