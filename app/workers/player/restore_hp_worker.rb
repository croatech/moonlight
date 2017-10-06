class Player::RestoreHpWorker
  include Sidekiq::Worker

  def perform(player_id, restoring_hp)
    player = Player.find(player_id)
    current_hp = player.current_hp
    full_hp = player.hp

    current_hp += restoring_hp
    # if current hp more then current_hp = final hp
    current_hp = full_hp if current_hp > full_hp
    player.current_hp = current_hp
    player.save
    Player::RestoreHpService.new(player).call if current_hp < full_hp
  end
end
