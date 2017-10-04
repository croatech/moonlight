require 'spec_helper'

describe Stuff::PutOnService do
  subject do
    Stuff::PutOnService.call(player: player, item: item)
  end

  describe 'Equipment::Item' do
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
        it 'checks that item put to the inventory' do
          expect(player.equipment_items).to include(item)
        end

        it 'checks that current(old) item put from the inventory' do
          expect(player.equipment_items).not_to include(current_item)
        end
      end

      context 'stats changing' do
        it 'checks that hp increased' do
          expect { subject }.to change { player.hp }.from(0).to(6)
        end

        it 'checks that attack increased' do
          expect { subject }.to change { player.attack }.from(0).to(6)
        end

        it 'checks that defense increased' do
          expect { subject }.to change { player.defense }.from(0).to(6)
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
