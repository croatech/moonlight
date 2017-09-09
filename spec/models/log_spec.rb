require 'spec_helper'

describe Log, type: :model do
  it { is_expected.to belong_to(:player) }
end
