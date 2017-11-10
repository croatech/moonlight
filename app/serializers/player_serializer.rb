# == Schema Information
#
# Table name: players
#
#  id                  :integer          not null, primary key
#  name                :string
#  location_id         :integer
#  helmet_slot         :integer
#  armor_slot          :integer
#  mail_slot           :integer
#  gloves_slot         :integer
#  foots_slot          :integer
#  bracers_slot        :integer
#  belt_slot           :integer
#  weapon_slot         :integer
#  shield_slot         :integer
#  ring_slot           :integer
#  necklace_slot       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  gold                :integer          default(0)
#  attack              :integer          default(1)
#  defense             :integer          default(1)
#  hp                  :integer          default(20)
#  level               :integer          default(1)
#  exp                 :integer          default(0)
#  exp_next            :integer          default(100)
#  equipment           :string           default([]), is an Array
#  free_stats          :integer          default(10)
#  lumberjacking_skill :integer          default(0)
#  fishing_skill       :integer          default(0)
#  tools               :string           default([]), is an Array
#  lumberjacking_slot  :integer
#  fishing_slot        :integer
#  cloak_slot          :integer
#  pants_slot          :integer
#  current_hp          :integer
#  avatar_id           :integer
#

class PlayerSerializer < ActiveModel::Serializer
  attributes :gold,
             :free_stats,
             :hp,
             :attack,
             :defense,
             :name,
             :current_hp,
             :level,
             :exp,
             :exp_next,
             :avatar,
             :lumberjacking_skill,
             :fishing_skill,
             :active_movement,
             :location_id

  has_many :put_on_equipment_items
  has_many :put_on_tool_items
  has_many :equipment_items
  has_many :tool_items
  has_many :resources

  belongs_to :avatar

  def put_on_equipment_items
    object.wearable_equipment.includes(:category)
  end

  def put_on_tool_items
    object.wearable_tools.includes(:category)
  end
end
