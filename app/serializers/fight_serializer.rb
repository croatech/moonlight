class FightSerializer < ActiveModel::Serializer
  attributes :status, :winner

  belongs_to :player
  belongs_to :bot

  has_many :rounds

  attributes :current_round

  def current_round
    RoundSerializer.new(object.rounds.last)
  end
end