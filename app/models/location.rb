# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  cell       :boolean          default(FALSE)
#  inactive   :boolean          default(FALSE)
#

class Location < ApplicationRecord
  has_many :players
  has_many :location_bots
  has_many :location_resources
  has_many :bots, through: :location_bots
  has_many :resources, through: :location_resources
  has_many :location_locations
  has_many :near_locations, class_name: 'Location', through: :location_locations, source: :near_location

  validates :name, :slug, presence: true

  acts_as_tree

  scope :cells, -> { where(cell: true) }
end
