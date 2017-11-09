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

require 'spec_helper'

describe Movement, type: :model do
  it { is_expected.to belong_to(:player) }
  it { is_expected.to validate_presence_of(:player_id) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:path) }
end
