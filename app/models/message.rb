class Message < ApplicationRecord
  validates :player_id, :text, presence: true

  belongs_to :player
  belongs_to :recipient, class_name: 'Player'
end
