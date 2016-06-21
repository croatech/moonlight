class Location < ActiveRecord::Base

  has_attached_file :background, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\Z/

  has_many :players
  
  validates :name, :slug, presence: true

  acts_as_tree
end
