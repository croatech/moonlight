require 'spec_helper'

describe Equipment::Items::PutOnService do
  subject do
    Equipment::Items::PutOnService.call(player: player, item: item)
  end

  let(:current_item) { create(:equipment_item, hp: 0, defense: 0, attack: 0) }
  let(:item) { create(:equipment_item, hp: 6, defense: 6, attack: 6) }
  let(:player) { create(:player, armor_slot: current_item.id, hp: 0, defense: 0, attack: 0) }
  let!(:stuff) { create(:stuff, player: player, stuffable: item) }

  describe 'success' do
    it 'check that service succeeded' do
      expect(subject.success?).to eq true
    end

    it 'checks that the new item replaced the current item in the inventory' do
      expect { subject }.to change { player.armor_slot }.from(current_item.id).to(item.id)
    end

    context 'inventory exchanging' do
      before :each do
        subject
      end

      it 'checks that current item put in the inventory' do
        expect(player.equipment_items).to include(current_item)
      end

      it 'checks that item put from the inventory' do
        expect(player.equipment_items).not_to include(item)
      end
    end

    context 'stats changing' do
      it 'checks that hp increased' do
        expect { subject }.to change { player.hp }.by(item.hp)
      end

      it 'checks that attack increased' do
        expect { subject }.to change { player.attack }.by(item.attack)
      end

      it 'checks that defense increased' do
        expect { subject }.to change { player.defense }.by(item.defense)
      end
    end
  end
end
