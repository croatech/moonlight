require 'spec_helper'

describe Resource, type: :model do
  it { is_expected.to belong_to(:item) }
  it { is_expected.to have_many(:location_resources) }
  it { is_expected.to have_many(:locations) }
  it { is_expected.to have_and_belong_to_many(:players) }
end
