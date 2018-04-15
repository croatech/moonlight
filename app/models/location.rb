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
  has_many :location_bots, dependent: :destroy
  has_many :location_resources, dependent: :destroy
  has_many :bots, through: :location_bots, dependent: :destroy
  has_many :resources, through: :location_resources, dependent: :destroy
  has_many :location_locations, dependent: :destroy
  has_many :near_locations, class_name: 'Location', through: :location_locations, source: :near_location

  validates :name, :slug, presence: true

  acts_as_tree

  scope :cells, -> { where(cell: true) }
  scope :active, -> { where(inactive: false) }

  # name of location from you start when exit from the city
  START_LOCATION_NAME = 'Shady Walk'

  def in_city?
    self.name == 'Moon Light' || self.parent.name == 'Moon Light'
  end
end
