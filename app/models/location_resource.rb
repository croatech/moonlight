class LocationResource < ActiveRecord::Base

  validates :location_id, uniqueness: { scope: :resource_id }

  belongs_to :location
  belongs_to :resource
end
