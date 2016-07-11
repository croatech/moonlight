class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :location

  belongs_to :location
end
