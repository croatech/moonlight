class UserObserver < ActiveRecord::Observer

  def after_create(user)
    player_create(user)
  end

  private

  def player_create(user)
    default_avatar = Avatar.first

    Player.create(user_id: user.id, current_hp: 20, gold: 1500, name: "Player №#{Player.count + 1}", frame_size: 2, 
                  avatar_id: default_avatar.id, name: user.name)
  end
end