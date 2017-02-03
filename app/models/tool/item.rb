class Tool::Item < ApplicationRecord

  self.inheritance_column = nil

  belongs_to :category, class_name: 'Tool::Category', foreign_key: 'category_id'

  has_one :resource

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :category_id, :price, :required_skill, :type, presence: true

  def sell_price
    price * 0.1
  end
end
