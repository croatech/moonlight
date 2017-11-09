require 'spec_helper'

describe Movements::CreateService do
  let(:location) { create(:location, cell: true, inactive: false) }
  let(:player) { create(:player, location: location) }
  let(:near_location) { create(:location, cell: true, inactive: false) }
  let!(:location_location) { create(:location_location, location: location, near_location: near_location) }

  subject do
    Movements::CreateService.new(player, near_location).call
  end

  it 'checks that player has an active_movement' do
    expect { subject }.to change { player.active_movement.present? }.from(false).to(true)
  end

  it 'checks that worker created' do
    expect { subject }.to change { Sidekiq::Worker.jobs.size }.from(0).to(1)
  end

  context 'movement object' do
    before :each do
      subject
    end

    let(:movement) { player.active_movement }

    it 'checks that movement for player created' do
      expect(movement).not_to be_nil
    end

    it 'checks that movement has an active status' do
      expect(movement.status).to eq 'active'
    end

    it 'checks that movement has the right path' do
      expect(movement.path).to eq([location.id.to_s, near_location.id.to_s])
    end
  end
end
