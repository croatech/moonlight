class Round < ApplicationRecord

  belongs_to :fight

  enum status: [:active, :finished]
end
