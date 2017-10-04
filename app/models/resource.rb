# == Schema Information
#
# Table name: resources
#
#  id                 :integer          not null, primary key
#  name               :string
#  item_id            :integer
#  price              :integer
#  type               :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Resource < ApplicationRecord
  # TODO change type to category_id and add required_skill
  self.inheritance_column = nil

  belongs_to :item, class_name: 'Tool::Item', foreign_key: 'item_id'

  has_many :location_resources
  has_many :locations, through: :location_resources

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def sell_price
    price
  end
end
