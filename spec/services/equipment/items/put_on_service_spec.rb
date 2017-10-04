require 'spec_helper'

describe Equipment::Items::PutOnService do
  subject do
    Equipment::Items::PutOnService.call(player: player, item: item)
  end

  let(:object) { subject.right }
  let(:errors) { subject.left }

  let(:player) { create(:player) }
  let(:item) { create(:equipment_item) }
  let!(:stuff) { create(:stuff, player: player, stuffable: item) }

  describe 'success' do
    it 'check that service succeeded' do
      expect(subject.success?).to eq true
    end

    it 'check that service has not errors' do
      expect(errors).to be_nil
    end
  end

  describe 'gold' do
    context 'not enough' do
      let(:player) { create(:player, gold: 0, level: 6) }

      it 'check that service failed' do
        expect(subject.failure?).to eq true
      end

      it 'check that service has errors' do
        expect(errors).not_to be_nil
      end

      it 'checks that service has particular error' do
        expect(errors).to include('Gold is not enough')
      end
    end
  end

  describe 'level' do
    context 'not enough' do
      let(:player) { create(:player, level: 1, gold: 6) }

      it 'check that service failed' do
        expect(subject.failure?).to eq true
      end

      it 'check that service has errors' do
        expect(errors).not_to be_nil
      end

      it 'checks that service has particular error' do
        expect(errors).to include('Level is not enough')
      end
    end
  end
end
