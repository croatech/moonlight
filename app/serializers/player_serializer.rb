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
#  image_file_name     :string
#  image_content_type  :string
#  image_file_size     :integer
#  image_updated_at    :datetime
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
             :level
end
