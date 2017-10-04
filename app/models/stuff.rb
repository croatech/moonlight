# == Schema Information
#
# Table name: stuffs
#
#  id             :integer          not null, primary key
#  stuffable_type :string           not null
#  stuffable_id   :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  player_id      :integer          not null
#

class Stuff < ApplicationRecord
  validates :stuffable_id, :stuffable_type, :player_id, presence: true

  belongs_to :stuffable, polymorphic: true
  belongs_to :player
end
