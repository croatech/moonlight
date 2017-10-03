# == Schema Information
#
# Table name: tool_items
#
#  id                 :integer          not null, primary key
#  name               :string
#  price              :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  required_skill     :integer
#  type               :string
#  tool_category_id   :integer
#

class Tool::Item < ApplicationRecord

  self.inheritance_column = nil

  belongs_to :category, class_name: 'Tool::Category', foreign_key: 'tool_category_id'

  has_one :resource

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :tool_category_id, :price, :required_skill, :type, presence: true

  def sell_price
    price * 0.1
  end
end
