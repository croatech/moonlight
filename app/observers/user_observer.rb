class UserObserver < ActiveRecord::Observer

  def after_create(user)
    player_create(user)
  end

  private

  def player_create(user)
    Player.create(user_id: user.id, current_hp: 20, gold: 1500, image: File.new("#{Rails.root}/app/assets/images/players/warrior.jpg"), name: "Player №#{Player.count + 1}",
                  frame_size: 2)
  end
end