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

require 'spec_helper'

describe Log, type: :model do
  it { is_expected.to belong_to(:player) }
end
