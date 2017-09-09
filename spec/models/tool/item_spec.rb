require 'spec_helper'

describe Tool::Item, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:category_id) }
  it { is_expected.to validate_presence_of(:required_skill) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to have_one(:resource) }
end
