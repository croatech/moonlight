class RoundSerializer < ActiveModel::Serializer
  attributes :player_damage,
             :bot_damage,
             :player_hp,
             :bot_hp,
             :player_defense_point,
             :player_attack_point,
             :bot_defense_point,
             :bot_attack_point
end