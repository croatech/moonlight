class User < ApplicationRecord
  # Player object creates after User creates (users/registraions_controller)
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_one :player

  validates :name, presence: true, uniqueness: true
end
