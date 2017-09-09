require 'spec_helper'

describe Bot, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:attack) }
  it { is_expected.to validate_presence_of(:defense) }
  it { is_expected.to validate_presence_of(:hp) }
  it { is_expected.to have_many(:fights) }
  it { is_expected.to have_many(:location_bots) }
  it { is_expected.to have_many(:locations) }
end
