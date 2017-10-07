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

class Equipment::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :required_level, :price, :hp, :defense, :attack, :category, :sell_price

  belongs_to :category, each_serializer: Equipment::Category
end
