# == Schema Information
#
# Table name: location_locations
#
#  id               :integer          not null, primary key
#  location_id      :integer          not null
#  near_location_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class LocationLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
