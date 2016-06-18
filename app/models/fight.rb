class Fight < ActiveRecord::Base

  belongs_to :player

  has_many :rounds

  enum status: [:active, :finished]

  validates :player_id, uniqueness: { scope: [:enemy_id, :status] }

  protected

  def enemy
  end

  def winner
  end
end
