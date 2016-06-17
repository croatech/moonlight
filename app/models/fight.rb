class Fight < ActiveRecord::Base

  belongs_to :player

  enum status: [:active, :finished]

  protected

  def enemy
  end

  def winner
  end
end
