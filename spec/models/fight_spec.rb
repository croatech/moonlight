# == Schema Information
#
# Table name: fights
#
#  id                :integer          not null, primary key
#  player_id         :integer
#  bot_id            :integer
#  status            :integer          default("active")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  winner_type       :string
#  dropped_gold      :integer
#  winner_id         :integer
#  dropped_item_id   :integer
#  dropped_item_type :string
#

require 'spec_helper'

describe Fight, type: :model do
  it { is_expected.to have_many(:rounds) }
  it { is_expected.to belong_to(:player) }
  it { is_expected.to belong_to(:bot) }
end
