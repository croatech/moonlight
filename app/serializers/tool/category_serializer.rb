class Tool::CategorySerializer < ActiveModel::Serializer
  attributes :name

  has_many :items
end
