require 'spec_helper'

describe Avatar, type: :model do
  it { is_expected.to have_many(:players) }
end
