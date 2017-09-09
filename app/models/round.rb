# == Schema Information
#
# Table name: rounds
#
#  id            :integer          not null, primary key
#  fight_id      :integer
#  player_damage :integer
#  bot_damage    :integer
#  status        :integer          default("active")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  player_hp     :integer
#  bot_hp        :integer
#

class Round < ApplicationRecord

  belongs_to :fight

  enum status: %i(active finished)
end
