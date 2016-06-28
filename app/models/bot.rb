class Bot < ActiveRecord::Base

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
    Equipment::Item.not_artifact.sample.id
  end

  def try_drop_item
    try_chance(percent: 10)
  end
end
