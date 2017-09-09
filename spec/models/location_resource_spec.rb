require 'spec_helper'

describe LocationResource, type: :model do
  it { is_expected.to belong_to(:location) }
  it { is_expected.to belong_to(:resource) }
end
