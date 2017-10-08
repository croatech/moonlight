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

class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :image, :price, :name
end
