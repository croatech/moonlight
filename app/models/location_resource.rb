# == Schema Information
#
# Table name: location_resources
#
#  id          :integer          not null, primary key
#  location_id :integer
#  resource_id :integer
#

class LocationResource < ApplicationRecord

  validates :location_id, uniqueness: { scope: :resource_id }

  belongs_to :location
  belongs_to :resource
end
