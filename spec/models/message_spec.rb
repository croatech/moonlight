require 'spec_helper'

describe Message, type: :model do
  it { is_expected.to validate_presence_of(:player_id) }
  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to belong_to(:player) }
  it { is_expected.to belong_to(:recipient) }
end
