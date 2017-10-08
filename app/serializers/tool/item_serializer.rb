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

class Tool::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :required_skill, :price, :image, :sell_price
end
