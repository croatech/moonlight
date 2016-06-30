class Player::RepairHpWorker
  include Sidekiq::Worker

  def perform(player_id, current)
    player = Player.find(player_id)
    current_hp = current
    final_hp = player.hp
    increase_const = player.hp * Player::REGENERATION_HP_PERCENT
    
    if current_hp < final_hp
      current_hp += increase_const
      current_hp = final_hp if current_hp > final_hp # if current hp more then final hp
      player.current_hp = current_hp
      player.save
      Player::RepairHpWorker.perform_at(5.seconds.from_now, player_id, current_hp)
    end
  end
end