# == Schema Information
#
# Table name: equipment_items
#
#  id                    :integer          not null, primary key
#  name                  :string
#  attack                :integer          default(0)
#  defense               :integer          default(0)
#  hp                    :integer          default(0)
#  required_level        :integer          default(1)
#  price                 :integer
#  image_file_name       :string
#  image_content_type    :string
#  image_file_size       :integer
#  image_updated_at      :datetime
#  artifact              :boolean          default(FALSE)
#  equipment_category_id :integer
#

class Equipment::Item < ApplicationRecord

  self.inheritance_column = nil

  belongs_to :category, class_name: 'Equipment::Category', foreign_key: 'equipment_category_id'

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :equipment_category_id, :required_level, :price, presence: true

  def sell_price
    self.artifact? ? price : price * 0.9
  end

  def type
    category.type.downcase
  end

  def slot_name
    "#{type}_slot"
  end

  def available_for_player?(player)
    required_level <= player.level
  end
end
