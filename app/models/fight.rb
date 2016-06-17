class Fight < ActiveRecord::Base

  belongs_to :player

  has_many :rounds

  enum status: [:active, :finished]

  protected

  def enemy
  end

  def winner
  end
end
