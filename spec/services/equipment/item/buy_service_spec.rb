require 'spec_helper'

describe Equipment::Item::BuyService do
  subject do
    Equipment::Item::BuyService.new.call(player: player, item: item)
  end

  let(:object) { subject.right }
  let(:errors) { subject.left }

  let(:player) { create(:player, gold: 666, level: 666) }
  let(:item) { build_stubbed(:equipment_item, price: 6, required_level: 6) }

  describe 'gold checking' do
    context 'enough' do
      it 'check that sevice succeeded' do
        expect(subject.success?).to eq true
      end

      it 'checks that player has item in equipment' do
        expect(player.equipment).to include(item.id)
      end
    end
  end
end
