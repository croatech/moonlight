require 'spec_helper'

describe Locations::FindShortestPathService do
  let(:location) { create(:location, cell: true, inactive: false) }
  let(:near_location) { create(:location, cell: true, inactive: false) }
  let!(:location_location) { create(:location_location, location: location, near_location: near_location) }

  subject do
    Locations::FindShortestPathService.new(from_location_id: location.id, to_location_id: near_location.id).call
  end

  let(:object) { subject }

  context 'path between two locations' do
    it 'checks that path is correct' do
      expect(object).to eq([1, 2])
    end
  end

  context 'path between more than two locations' do
    let(:location3) { create(:location, cell: true, inactive: false) }
    let(:location4) { create(:location, cell: true, inactive: false) }
    let!(:location_location2) { create(:location_location, location: near_location, near_location: location3) }
    let!(:location_location3) { create(:location_location, location: location3, near_location: location4) }

    subject do
      Locations::FindShortestPathService.new(from_location_id: location.id, to_location_id: location4.id).call
    end

    it 'checks that path is correct' do
      expect(object).to eq([1, 2, 3, 4])
    end
  end
end
