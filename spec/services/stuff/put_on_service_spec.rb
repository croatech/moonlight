require 'spec_helper'

describe Stuff::PutOnService do
  subject do
    Stuff::PutOnService.call(player: player, item: item)
  end

  describe 'Equipment::Item' do
    let(:current_item) { create(:equipment_item, hp: 1, defense: 1, attack: 1) }
    let(:item) { create(:equipment_item, hp: 6, defense: 6, attack: 6) }
    let(:player) { create(:player, armor_slot: current_item.id, hp: 2, defense: 2, attack: 2) }
    let!(:stuff) { create(:stuff, player: player, stuffable: item) }

    describe 'success' do
      it 'check that service succeeded' do
        expect(subject.success?).to eq true
      end

      it 'checks that the new item replaced the current item in the inventory' do
        expect { subject }.to change { player.armor_slot }.from(current_item.id).to(item.id)
      end

      context 'inventory exchanging' do
        it 'checks that item put to the inventory' do
          expect(player.equipment_items).to include(item)
        end

        it 'checks that current(old) item put from the inventory' do
          expect(player.equipment_items).not_to include(current_item)
        end
      end

      context 'stats increasing' do
        it 'checks that hp changed' do
          expect { subject }.to change { player.hp }.from(player.hp).to(player.hp - current_item.hp + item.hp)
        end

        it 'checks that attack changed' do
          expect { subject }.to change { player.attack }.from(player.attack).to(player.attack - current_item.attack + item.attack)
        end

        it 'checks that defense changed' do
          expect { subject }.to change { player.defense }.from(player.defense).to(player.defense - current_item.defense + item.defense)
        end

        it 'checks that current hp changed' do
          expect { subject }.to change { player.current_hp }.from(player.current_hp).to(player.current_hp - current_item.hp)
        end
      end
    end

    describe 'failure' do
      context 'player has not an item' do
        it 'check that service failed' do
          stuff.delete
          expect(subject.failure?).to eq true
        end
      end

      context 'level is not enough' do
        it 'check that service failed' do
          item.update(required_level: 10)
          expect(subject.failure?).to eq true
        end
      end
    end
  end

  describe 'Tool::Item' do
    let(:category) { create(:tool_category, type: 'lumberjacking') }
    let(:current_item) { create(:tool_item, category: category) }
    let(:item) { create(:tool_item, category: category, required_skill: 50) }
    let(:player) { create(:player, lumberjacking_slot: current_item.id, lumberjacking_skill: 50) }
    let!(:stuff) { create(:stuff, player: player, stuffable: item) }

    describe 'success' do
      it 'check that service succeeded' do
        expect(subject.success?).to eq true
      end

      it 'checks that the new item replaced the current item in the inventory' do
        expect { subject }.to change { player.lumberjacking_slot }.from(current_item.id).to(item.id)
      end

      context 'inventory exchanging' do
        it 'checks that item put to the inventory' do
          expect(player.tool_items).to include(item)
        end

        it 'checks that current(old) item put from the inventory' do
          expect(player.tool_items).not_to include(current_item)
        end
      end
    end

    describe 'failure' do
      context 'player has not an item' do
        it 'check that service failed' do
          stuff.delete
          expect(subject.failure?).to eq true
        end
      end

      context 'level is not enough' do
        it 'check that service failed' do
          item.update(required_skill: 100)
          expect(subject.failure?).to eq true
        end
      end
    end
  end
end
