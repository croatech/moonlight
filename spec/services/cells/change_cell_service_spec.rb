require 'spec_helper'

describe Cells::ChangeCellService do
  let(:current_cell) { create(:location, cell: true, inactive: false) }
  let(:player) { create(:player, location: current_cell) }
  let(:new_cell) { create(:location, cell: true, inactive: false) }
  let!(:location_location) { create(:location_location, location: current_cell, near_location: new_cell) }

  subject do
    Cells::ChangeCellService.new(player, new_cell).call
  end

  context 'if there is not active movement' do
    it 'checks that worker ran' do
      expect { subject }.to change { Sidekiq::Worker.jobs.size }.from(0).to(1)
    end
  end

  context 'if player has an active movement' do
    let!(:movement) { create(:movement, player: player, status: 'active') }

    it 'checks that worker will not be created' do
      expect { subject }.not_to change { Sidekiq::Worker.jobs.size }
    end
  end

  context 'if location is current' do
    subject do
      Cells::ChangeCellService.new(player, current_cell).call
    end

    it 'checks that worker will not be created' do
      expect { subject }.not_to change { Sidekiq::Worker.jobs.size }
    end
  end

  context 'if location is inactive' do
    it 'checks that worker will not be created' do
      current_cell.update(inactive: true)
      expect { subject }.not_to change { Sidekiq::Worker.jobs.size }
    end
  end
end