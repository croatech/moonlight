class LocationBot < ApplicationRecord

  validates :location_id, uniqueness: { scope: :bot_id }

  belongs_to :location
  belongs_to :bot
end