require 'spec_helper'

describe Equipment::Item, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:category_id) }
  it { is_expected.to validate_presence_of(:required_level) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to belong_to(:category) }
end
