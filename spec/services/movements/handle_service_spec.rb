require 'spec_helper'

describe Movements::HandleService do
  let(:location) { create(:location, cell: true, inactive: false) }
  let(:player) { create(:player, location: location) }
  let(:near_location) { create(:location, cell: true, inactive: false) }
  let!(:location_location) { create(:location_location, location: location, near_location: near_location) }
  let!(:movement) { create(:movement, player: player, status: 'active') }

  subject do
    Movements::HandleService.new(player).call
  end

  it 'checks that worker created' do
    expect { subject }.to change { Sidekiq::Worker.jobs.size }.from(0).to(1)
  end
end
