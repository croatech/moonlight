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

require 'test_helper'

class StuffTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
