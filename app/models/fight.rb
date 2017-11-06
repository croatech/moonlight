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

  belongs_to :winner, polymorphic: true
  belongs_to :dropped_item, polymorphic: true

  enum status: %i(active finished)

  POINTS = %w(
    head
    chest
    waist
    hands
    legs
  )
end
