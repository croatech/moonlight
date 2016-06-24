class Resource < ActiveRecord::Base

  self.inheritance_column = nil

  belongs_to :location
  belongs_to :item, class_name: 'Tool::Item', foreign_key: 'item_id'

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
