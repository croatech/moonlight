require 'spec_helper'

describe Fight, type: :model do
  it { is_expected.to have_many(:rounds) }
  it { is_expected.to belong_to(:player) }
  it { is_expected.to belong_to(:bot) }
end
