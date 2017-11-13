class MessageSerializer < ActiveModel::Serializer
  attributes :text

  belongs_to :player
  belongs_to :recipient

  class PlayerSerializer < ActiveModel::Serializer
    attributes :name, :id
  end
end
