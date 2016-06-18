class Fight < ActiveRecord::Base

  belongs_to :player
  belongs_to :bot

  has_many :rounds, dependent: :destroy

  enum status: [:active, :finished]

  def winner
    if winner_type == 'Player'
      Player.find(self.player_id)
    else
      Bot.find(self.bot_id)
    end
  end
end
