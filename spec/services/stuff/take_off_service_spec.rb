require 'spec_helper'

describe Stuff::TakeOffService do
  subject do
    Stuff::TakeOffService.call(player: player, item: item)
  end

  describe 'Equipment::Item' do
    let(:item) { create(:equipment_item, hp: 6, defense: 6, attack: 6) }
    let(:player) { create(:player, armor_slot: item.id, hp: 6, defense: 6, attack: 6, current_hp: 6) }

    describe 'success' do
      it 'check that service succeeded' do
        expect(subject.success?).to eq true
      end

      it 'checks that a current item put to the inventory' do
        expect { subject }.to change { player.equipment_items.count }.from(0).to(1)
      end

      it 'checks that a slot is empty' do
        expect { subject }.to change { player.armor_slot }.from(item.id).to(nil)
      end

      context 'stats decreasing' do
        it 'checks that hp changed' do
          expect { subject }.to change { player.hp }.from(player.hp).to(player.hp - item.hp)
        end

        it 'checks that attack changed' do
          expect { subject }.to change { player.attack }.from(player.attack).to(player.attack - item.attack)
        end

        it 'checks that defense changed' do
          expect { subject }.to change { player.defense }.from(player.defense).to(player.defense - item.defense)
        end

        it 'checks that current current hp has changed' do
          expect { subject }.to change { player.current_hp }.from(player.current_hp).to(player.current_hp - item.hp)
        end
      end
    end

    describe 'failure' do
      context 'player has not an item' do
        it 'check that service failed' do
          player[item.slot_name] = nil
          expect(subject.failure?).to eq true
        end
      end
    end
  end

  describe 'Tool::Item' do
    let(:item) { create(:tool_item) }
    let(:player) { create(:player, lumberjacking_slot: item.id) }

    describe 'success' do
      it 'check that service succeeded' do
        expect(subject.success?).to eq true
      end

      it 'checks that the new item replaced the current item in the inventory' do
        expect { subject }.to change { player.lumberjacking_slot }.from(item.id).to(nil)
      end
    end

    describe 'failure' do
      context 'player has not an item' do
        it 'check that service failed' do
          player[item.slot_name] = nil
          expect(subject.failure?).to eq true
        end
      end
    end
  end
end
