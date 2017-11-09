# == Schema Information
#
# Table name: location_locations
#
#  id               :integer          not null, primary key
#  location_id      :integer          not null
#  near_location_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class LocationLocation < ApplicationRecord
  validates :location_id, :near_location_id, presence: true

  belongs_to :location
  belongs_to :near_location, class_name: 'Location'
end
