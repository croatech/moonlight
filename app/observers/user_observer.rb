class UserObserver < ActiveRecord::Observer

  def after_create(user)
    profile_create(user)
  end

  private

  def profile_create(user)
    Profile.create(user_id: user.id)
  end
end