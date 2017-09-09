require 'spec_helper'

describe Player do
  let(:player) { create(:player, attack: 1, defense: 1, hp: 5) }

  context 'stats' do
    it 'checks increasing of attack' do
      player.increase_attack
      expect(player.attack).to eq 2
    end

    it 'checks increasing of defense' do
      player.increase_defense
      expect(player.defense).to eq 2
    end

    it 'checks increasing of hp' do
      player.increase_hp
      expect(player.hp).to eq 10
    end
  end
end
