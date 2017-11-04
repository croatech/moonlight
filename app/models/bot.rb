# == Schema Information
#
# Table name: bots
#
#  id         :integer          not null, primary key
#  name       :string
#  attack     :integer
#  defense    :integer
#  hp         :integer
#  inventory  :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  level      :integer
#  avatar     :string
#

class Bot < ApplicationRecord
  include Percentable

  has_many :fights
  has_many :location_bots
  has_many :locations, through: :location_bots

  mount_uploader :avatar, AvatarUploader

  validates :name, :attack, :defense, :hp, presence: true

  def given_exp
    rand(level * 10..level * 20)
  end

  def drop_gold
    rand(level * 10..level * 20)
  end

  def try_drop_gold
    try_chance(percent: 30)
  end

  def dropped_item
    Equipment::Item.not_artifact.where(required_level: self.level).sample
  end

  def try_drop_item
    try_chance(percent: 1)
  end
end
