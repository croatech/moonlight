class FightSerializer < ActiveModel::Serializer
  attributes :status, :winner_type

  belongs_to :player
  belongs_to :bot
  belongs_to :winner

  has_many :rounds

  attributes :current_round

  def current_round
    RoundSerializer.new(object.rounds.last)
  end
end