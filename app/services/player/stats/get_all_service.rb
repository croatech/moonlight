class Player::Stats::GetAllService

  attr_reader :player, :equipment

  def initialize(player, equipment_ids)
    @player = player
    @equipment = Equipment::Item.where(id: equipment_ids)
  end

  def call
    stats = {}
    
    Player::STATS.each do |stat_name|
      # get all stats from all wearable items + player's stats
      stats[stat_name] = equipment.pluck(stat_name.to_sym).reduce(:+)
      stats[stat_name] += player[stat_name]
    end

    stats
  end
end