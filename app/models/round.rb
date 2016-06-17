class Round < ActiveRecord::Base

  belongs_to :fight

  enum status: [:active, :finished]
end
