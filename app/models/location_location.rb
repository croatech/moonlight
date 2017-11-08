class LocationLocation < ApplicationRecord
  validates :location_id, :near_location_id, presence: true

  belongs_to :location
  belongs_to :near_location, class_name: 'Location'
end
