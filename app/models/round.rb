class Round < ApplicationRecord

  belongs_to :fight

  enum status: %i(active finished)
end
