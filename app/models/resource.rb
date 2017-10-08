# == Schema Information
#
# Table name: resources
#
#  id      :integer          not null, primary key
#  name    :string
#  item_id :integer
#  price   :integer
#  type    :string
#  image   :string
#

class Resource < ApplicationRecord
  # TODO change type to category_id and add required_skill
  self.inheritance_column = nil

  belongs_to :item, class_name: 'Tool::Item', foreign_key: 'item_id'

  has_many :location_resources
  has_many :locations, through: :location_resources

  mount_uploader :image, ImageUploader

  def sell_price
    price
  end
end
