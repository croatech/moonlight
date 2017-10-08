# == Schema Information
#
# Table name: tool_items
#
#  id               :integer          not null, primary key
#  name             :string
#  price            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  required_skill   :integer
#  tool_category_id :integer
#  image            :string
#

class Tool::Item < ApplicationRecord
  belongs_to :category, class_name: 'Tool::Category', foreign_key: 'tool_category_id'

  has_one :resource

  mount_uploader :image, ImageUploader

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
