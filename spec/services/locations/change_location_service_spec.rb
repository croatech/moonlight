require 'spec_helper'

describe Locations::ChangeLocationService do
  let(:current_location) { create(:location) }
  let(:player) { create(:player, location: current_location) }
  let(:new_location) { create(:location) }

  subject do
    Locations::ChangeLocationService.new(player, new_location).call
  end

  it 'checks that player belongs to current location' do
    expect(player.location_id).to eq current_location.id
  end

  it 'checks that current location of player has changed' do
    expect { subject }.to change { player.location_id }.from(current_location.id).to(new_location.id)
  end

  context 'if player has an active movement' do
    let!(:movement) { create(:movement, player: player, status: 'active') }

    it 'checks that location will not be changed' do
      expect { subject }.not_to change { player.location_id }
    end
  end

  context 'if location is current' do
    subject do
      Locations::ChangeLocationService.new(player, current_location).call
    end

    it 'checks that location will not be changed' do
      expect { subject }.not_to change { player.location_id }
    end
  end
end
