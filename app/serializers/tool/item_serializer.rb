class Tool::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :required_skill, :price
end
