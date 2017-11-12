require 'spec_helper'

describe Cells::ChangeCellService do
  let(:current_cell) { create(:location, cell: true, inactive: false) }
  let(:player) { create(:player, location: current_cell) }
  let(:new_cell) { create(:location, cell: true, inactive: false) }
  let!(:location_location) { create(:location_location, location: current_cell, near_location: new_cell) }

  subject do
    Cells::ChangeCellService.call(player: player, location: new_cell)
  end

  describe 'success' do
    it 'checks that service successed' do
      expect(subject.success?).to be_truthy
    end

    it 'checks that has no error' do
      expect(subject.error).to be_nil
    end

    it 'checks that worker ran' do
      expect { subject }.to change { Sidekiq::Worker.jobs.size }.from(0).to(1)
    end
  end

  describe 'failure' do
    context 'if movement in progress' do
      let!(:movement) { create(:movement, player: player, status: 'active') }

      it 'checks that service failed' do
        expect(subject.failure?).to be_truthy
      end

      it 'checks that service has a particular error' do
        expect(subject.error).to eq('You\'re already wakling')
      end

      it 'checks that worker will not be created' do
        expect { subject }.not_to change { Sidekiq::Worker.jobs.size }
      end
    end

    context 'if location is current' do
      subject do
        Cells::ChangeCellService.call(player: player, location: current_cell)
      end

      it 'checks that service failed' do
        expect(subject.failure?).to be_truthy
      end

      it 'checks that service has a particular error' do
        expect(subject.error).to eq('You\'re already here')
      end

      it 'checks that worker will not be created' do
        expect { subject }.not_to change { Sidekiq::Worker.jobs.size }
      end
    end

    context 'if location is inactive' do
      let(:new_cell) { create(:location, cell: true, inactive: true) }

      it 'checks that service failed' do
        expect(subject.failure?).to be_truthy
      end

      it 'checks that service has a particular error' do
        expect(subject.error).to eq('You can\'t go to uncharted lands')
      end

      it 'checks that worker will not be created' do
        expect { subject }.not_to change { Sidekiq::Worker.jobs.size }
      end
    end
  end
end