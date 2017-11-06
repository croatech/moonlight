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