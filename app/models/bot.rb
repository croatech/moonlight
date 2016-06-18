class Bot < ActiveRecord::Base

  has_many :fights

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :name, :attack, :defense, :hp, :type, presence: true
end
