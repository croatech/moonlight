# == Schema Information
#
# Table name: player_equipment_items
#
#  player_id :integer          not null
#  item_id   :integer          not null
#

class PlayerEquipmentItem < ApplicationRecord
  validates :player_id, :item_id, presence: true

  belongs_to :player
  belongs_to :equipment_item
end
