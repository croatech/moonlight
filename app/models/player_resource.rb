# == Schema Information
#
# Table name: player_resources
#
#  player_id   :integer
#  resource_id :integer
#

class PlayerResource < ApplicationRecord
  validates :player_id, :resource_id, presence: true

  belongs_to :player
  belongs_to :resource
end
