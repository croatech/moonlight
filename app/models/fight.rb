# == Schema Information
#
# Table name: fights
#
#  id           :integer          not null, primary key
#  player_id    :integer
#  bot_id       :integer
#  status       :integer          default("active")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  winner_type  :string
#  dropped_gold :integer
#  dropped_item :integer
#

class Fight < ApplicationRecord

  belongs_to :player
  belongs_to :bot

  has_many :rounds, dependent: :destroy

  enum status: %i(active finished)

  POINTS = %w(head
              chest
              belly
              hands
              legs)

  def winner
    if winner_type == 'Player'
      Player.find(self.player_id)
    else
      Bot.find(self.bot_id)
    end
  end

  def current_round
    self.rounds.active.last
  end
end
