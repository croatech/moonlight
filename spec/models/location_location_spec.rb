require 'spec_helper'

describe LocationLocation, type: :model do
  it { is_expected.to validate_presence_of(:location_id) }
  it { is_expected.to validate_presence_of(:near_location_id) }
  it { is_expected.to belong_to(:location) }
  it { is_expected.to belong_to(:near_location) }
end
