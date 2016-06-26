class UserObserver < ActiveRecord::Observer

  def after_create(user)
    player_create(user)
  end

  private

  def player_create(user)
    Player.create(user_id: user.id, gold: 500, image: File.new("#{Rails.root}/app/assets/images/players/warrior.jpg"), name: "Player №#{Player.count + 1}", inventory: [1,2,3,4,5,6,7,8,9,10,11])
  end
end