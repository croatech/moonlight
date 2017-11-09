# == Schema Information
#
# Table name: fights
#
#  id                :integer          not null, primary key
#  player_id         :integer
#  bot_id            :integer
#  status            :integer          default("active")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  winner_type       :string
#  dropped_gold      :integer
#  winner_id         :integer
#  dropped_item_id   :integer
#  dropped_item_type :string
#

class FightSerializer < ActiveModel::Serializer
  attributes :status, :winner_type, :dropped_gold

  belongs_to :player
  belongs_to :bot
  belongs_to :winner
  belongs_to :dropped_item

  has_many :rounds

  attributes :current_round

  def current_round
    RoundSerializer.new(object.rounds.last)
  end
end
