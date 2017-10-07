class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :image, :price, :name
end
