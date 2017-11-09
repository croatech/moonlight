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

require 'spec_helper'

describe LocationLocation, type: :model do
  it { is_expected.to validate_presence_of(:location_id) }
  it { is_expected.to validate_presence_of(:near_location_id) }
  it { is_expected.to belong_to(:location) }
  it { is_expected.to belong_to(:near_location) }
end
