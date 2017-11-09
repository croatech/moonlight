class Player::RestoreHpWorker
  include Sidekiq::Worker

  def perform(player_id, restoring_hp)

  end
end
