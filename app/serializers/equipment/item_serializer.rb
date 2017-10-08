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
#  artifact              :boolean          default(FALSE)
#  equipment_category_id :integer
#  image                 :string
#

class Equipment::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :required_level, :price, :hp, :defense, :attack, :category, :sell_price

  belongs_to :category, each_serializer: Equipment::Category
end
