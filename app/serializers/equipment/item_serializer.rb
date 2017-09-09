class Equipment::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :required_level, :price, :hp, :defense, :attack, :price
end
