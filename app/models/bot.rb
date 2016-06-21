class Bot < ActiveRecord::Base

  has_many :fights
  has_many :location_bots
  has_many :locations, through: :location_bots

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :name, :attack, :defense, :hp, :type, presence: true

  def exp
    self.attack * 1.5
  end
end
