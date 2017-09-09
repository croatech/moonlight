class Resource < ApplicationRecord

  self.inheritance_column = nil

  belongs_to :item, class_name: 'Tool::Item', foreign_key: 'item_id'

  has_many :location_resources
  has_many :locations, through: :location_resources

  has_and_belongs_to_many :players

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
