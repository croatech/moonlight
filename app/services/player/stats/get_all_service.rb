class Player::Stats::GetAllService

  attr_reader :player, :equipment

  def initialize(player, wearable_equipment)
    @player = player
    @equipment = wearable_equipment
  end

  def call
    stats = {}
    
    Player::STATS.each do |stat_name|
      if equipment.present?
        # get all stats from all wearable items + player's stats
        stats[stat_name] = equipment.pluck(stat_name.to_sym).reduce(:+)
        stats[stat_name] += player[stat_name]
      else
        stats[stat_name] = player[stat_name]
      end
    end

    stats
  end
end