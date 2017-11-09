# == Schema Information
#
# Table name: rounds
#
#  id                   :integer          not null, primary key
#  fight_id             :integer
#  player_damage        :integer
#  bot_damage           :integer
#  status               :integer          default("active")
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  player_hp            :integer
#  bot_hp               :integer
#  player_attack_point  :string
#  player_defense_point :string
#  bot_attack_point     :string
#  bot_defense_point    :string
#

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
