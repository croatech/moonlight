require 'spec_helper'

describe Equipment::Items::RecalculateStatsService do
  let(:object) { subject.right }
  let(:errors) { subject.left }

  let(:player) { create(:player, hp: 6, attack: 6, defense: 6) }
  let(:item) { create(:equipment_item, hp: 6, attack: 6, defense: 6) }

  describe 'increase' do
    subject do
      Equipment::Items::RecalculateStatsService.increase(player, item)
    end

    it 'checks that hp increased' do
      expect { subject }.to change { player.hp }.from(6).to(12)
    end

    it 'checks that hp increased' do
      expect { subject }.to change { player.attack }.from(6).to(12)
    end

    it 'checks that hp increased' do
      expect { subject }.to change { player.defense }.from(6).to(12)
    end
  end

  describe 'decrease' do
    subject do
      Equipment::Items::RecalculateStatsService.decrease(player, item)
    end

    it 'checks that hp increased' do
      expect { subject }.to change { player.hp }.from(6).to(0)
    end

    it 'checks that hp increased' do
      expect { subject }.to change { player.attack }.from(6).to(0)
    end

    it 'checks that hp increased' do
      expect { subject }.to change { player.defense }.from(6).to(0)
    end
  end
end
