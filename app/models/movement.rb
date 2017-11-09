# == Schema Information
#
# Table name: movements
#
#  id         :integer          not null, primary key
#  path       :string           not null, is an Array
#  player_id  :integer          not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Movement < ApplicationRecord
  belongs_to :player
end
