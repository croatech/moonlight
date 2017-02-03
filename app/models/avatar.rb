class Avatar < ApplicationRecord

  has_attached_file :image, default_url: "/images/players/avatars/1.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :players

  scope :not_private, -> { where(private: false) }
end
