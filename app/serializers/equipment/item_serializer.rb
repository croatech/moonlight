class Equipment::ItemSerializer < ActiveModel::Serializer
  attributes :name, :image, :required_level, :price
end
