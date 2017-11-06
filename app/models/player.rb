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

class Player < ApplicationRecord
  include Percentable

  validates :name, :user_id, presence: true

  belongs_to :location
  belongs_to :user
  belongs_to :avatar

  has_many :fights
  has_many :logs

  has_many :stuffs
  has_many :equipment_items, class_name: 'Equipment::Item', through: :stuffs, source: :stuffable, source_type: 'Equipment::Item'
  has_many :tool_items, class_name: 'Tool::Item', through: :stuffs, source: :stuffable, source_type: 'Tool::Item'
  has_many :resources, class_name: 'Resource', through: :stuffs, source: :stuffable, source_type: 'Resource'

  scope :recently_online, -> { where('updated_at > ?', 15.minutes.ago).order(:name) }

  STATS = %w[attack defense hp]
  EQUIPMENT_SLOTS = %w[helmet armor mail gloves bracers foots belt weapon shield ring necklace cloak pants]
  TOOL_SLOTS = %w[lumberjacking fishing]

  INITIAL_HP = 20
  INITIAL_GOLD = 1500
  REGENERATION_HP_PERCENT = 10
  REGENERATION_HP_DELAY = 5 # seconds

  # generate methods for increase of stats
  STATS.each do |stat|
    stat_name = stat.to_sym
    method_name = "increase_#{stat}".to_sym

    define_method(method_name) do
      # increase for 5 if hp stat
      self.increment!(stat_name, 4) if stat_name == :hp
      self.increment!(stat_name, 1)
    end
  end

  def level_up_gold
    level * 150
  end

  def level_up_exp
    exp_next * 2
  end

  def try_skill_up(skill_name)
    case self[skill_name]
    when 0..50
      try_chance(percent: 50)
    when 50..100
      try_chance(percent: 30)
    when 100..150
      try_chance(percent: 20)
    when 150..200
      try_chance(percent: 15)
    when 200..250
      try_chance(percent: 10)
    when 250..300
      try_chance(percent: 7)
    when 300..350
      try_chance(percent: 5)
    when 350..400
      try_chance(percent: 2)
    end
  end

  def wearable_equipment
    wearable_equipment_ids = Player::Inventory::WearableItemsIdsService.new(self, Player::EQUIPMENT_SLOTS).call
    Equipment::Item.where(id: wearable_equipment_ids).includes(:category)
  end

  def wearable_tools
    wearable_tools_ids = Player::Inventory::WearableItemsIdsService.new(self, Player::TOOL_SLOTS).call
    Tool::Item.where(id: wearable_tools_ids).includes(:category)
  end

  def stuff_item(item)
    stuffs.where(stuffable: item).take
  end

  def has_an_item?(item)
    stuff_item(item).present?
  end

  def avatar
    return Avatar.find(avatar_id).image if avatar_id.present?
  end

  def last_fight
    self.fights.last
  end
end
