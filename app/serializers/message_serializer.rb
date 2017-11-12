class MessageSerializer < ActiveModel::Serializer
  attributes :text

  belongs_to :player
  belongs_to :recipient
end
