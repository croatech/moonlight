# == Schema Information
#
# Table name: player_resources
#
#  player_id   :integer
#  resource_id :integer
#

require 'spec_helper'

describe PlayerResource, type: :model do
  it { is_expected.to validate_presence_of(:player_id) }
  it { is_expected.to validate_presence_of(:resource_id) }
  it { is_expected.to belong_to(:player) }
  it { is_expected.to belong_to(:resource) }
end
