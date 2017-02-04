class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_one :player

  validates :name, presence: true, uniqueness: true

  after_create :create_player

  private

  def create_player
    default_avatar_id = Avatar.any? ? Avatar.first.id : nil
    Player.create(user_id: self.id, current_hp: 20, gold: 1500, name: self.name, avatar_id: default_avatar_id)
  end
end
