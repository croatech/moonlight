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
#  tool_category_id   :integer
#

class Tool::Item < ApplicationRecord
  belongs_to :category, class_name: 'Tool::Category', foreign_key: 'tool_category_id'

  has_one :resource

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :tool_category_id, :price, :required_skill, presence: true

  def sell_price
    price * 0.1
  end

  def type
    category.type.downcase
  end

  def slot_name
    "#{type}_slot"
  end

  def skill_name
    "#{type}_skill"
  end

  def available_for_player?(player)
    required_skill <= player.send(skill_name)
  end
end
