# == Schema Information
#
# Table name: logs
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Log < ApplicationRecord
  
  belongs_to :player

  MAXIMUM_SIZE = 50
end
