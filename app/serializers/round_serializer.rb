class RoundSerializer < ActiveModel::Serializer
  attributes :player_damage, :bot_damage, :player_hp, :bot_hp
end