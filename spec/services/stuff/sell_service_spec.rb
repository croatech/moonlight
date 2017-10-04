require 'spec_helper'

describe Stuff::SellService do
  subject do
    Stuff::SellService.call(player: player, item: item)
  end

  let(:object) { subject.right }
  let(:errors) { subject.left }

  let(:player) { create(:player, gold: 0) }
  let(:item) { create(:equipment_item) }
  let!(:stuff) { create(:stuff, player: player, stuffable: item) }

  describe 'success' do
    it 'check that service succeeded' do
      expect(subject.success?).to eq true
    end

    it 'check that service has not errors' do
      expect(errors).to be_nil
    end

    it 'checks that stuff is deleted' do
      expect { subject }.to change { player.stuffs.count }.from(1).to(0)
    end

    it 'checks that player has got money deposite' do
      expect { subject }.to change { player.gold }.from(0).to(item.sell_price)
    end
  end
end
