class UserObserver < ActiveRecord::Observer

  def after_create(user)
    character_create(user)
  end

  private

  def character_create(user)
    Character.create(user_id: user.id)
  end
end