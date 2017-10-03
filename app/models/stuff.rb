class Stuff < ApplicationRecord
  validates :stuffable_id, :stuffable_type, :player_id, presence: true

  belongs_to :stuffable, polymorphic: true
  belongs_to :player
end
