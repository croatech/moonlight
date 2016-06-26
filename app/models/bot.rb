class Bot < ActiveRecord::Base

  has_many :fights
  has_many :location_bots
  has_many :locations, through: :location_bots

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :name, :attack, :defense, :hp, presence: true

  def given_exp
    level * 20
  end

  def drop_gold
    level * 20
  end

  def try_drop_gold_chance
    1 == rand(1..2)
  end

  def drop_item
    Equipment::Item.all.sample.id
  end

  def try_drop_item_chance
    1 == rand(1..2)
  end
end
