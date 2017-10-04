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

require 'spec_helper'

describe Stuff, type: :model do
  it { is_expected.to belong_to(:stuffable) }
  it { is_expected.to belong_to(:player) }
  it { is_expected.to validate_presence_of(:stuffable_id) }
  it { is_expected.to validate_presence_of(:stuffable_type) }
  it { is_expected.to validate_presence_of(:player_id) }
end
