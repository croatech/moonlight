class Player::RepairHpWorker
  include Sidekiq::Worker

  def perform(player_id, increasing_hp)
    player = Player.find(player_id)
    current_hp = player.current_hp
    final_hp = player.hp 
    
    current_hp += increasing_hp
    current_hp = final_hp if current_hp > final_hp # if current hp more then current_hp = final hp
    player.current_hp = current_hp
    player.save
  end
end