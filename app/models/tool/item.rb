class Tool::Item < ActiveRecord::Base

  belongs_to :category, class_name: 'Tool::Category', foreign_key: 'category_id'

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :category_id, :cost, presence: true
end
