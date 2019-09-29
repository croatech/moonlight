module Generators::Players
  def self.call
    user = User.create!(email: 'croaton6@gmail.com', password: 'password', username: 'Croaton')
    Player.create(user_id: user.id, current_hp: Player::INITIAL_HP, gold: Player::INITIAL_GOLD, name: user.username, avatar_id: Avatar.first.id, location: Location.first)
  end
end
