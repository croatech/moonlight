class Users::CreateService
  include Interactor

  def call
    pre_initialize

    ActiveRecord::Base.transaction do
      user = create_user
      create_player(user)
    end
  end

  private

  attr_reader :params

  def pre_initialize
    @params = context.params
  end

  def create_user
    user = User.new(params)
    if user.valid?
      user.save
    else
      context.fail!(errors: user.errors.full_messages)
    end

    user
  end

  def create_player(user)
    Player.create(
      user_id: user.id,
      current_hp: Player::INITIAL_HP,
      gold: Player::INITIAL_GOLD,
      name: user.username,
      avatar_id: Avatar.first.id,
      location_id: Location.first.id
    )
  end
end
