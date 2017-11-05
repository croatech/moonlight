class FightSerializer < ActiveModel::Serializer
  belongs_to :player
  belongs_to :bot

  has_many :rounds

  attributes :current_round

  def current_round
    RoundSerializer.new(object.rounds.active.last)
  end
end