# == Schema Information
#
# Table name: bots
#
#  id                 :integer          not null, primary key
#  name               :string
#  attack             :integer
#  defense            :integer
#  hp                 :integer
#  inventory          :string           default([]), is an Array
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  level              :integer
#

class Bot < ApplicationRecord

  include Percentable

  has_many :fights
  has_many :location_bots
  has_many :locations, through: :location_bots

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :name, :attack, :defense, :hp, presence: true

  def given_exp
    rand(level * 10..level * 20)
  end

  def drop_gold
    rand(level * 10..level * 20)
  end

  def try_drop_gold
    try_chance(percent: 100)
  end

  def drop_item
    Equipment::Item.not_artifact.where(required_level: self.level).sample.id
  end

  def try_drop_item
    try_chance(percent: 10)
  end

  def avatar
    image
  end
end
