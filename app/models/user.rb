class User < ApplicationRecord
  # Player object creates after User creates (users/registraions_controller)
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_one :player, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
