require 'spec_helper'

describe Player do
  let(:user) { create(:user) }
  let(:player) { user.player }

  context 'stats' do
    # default stats after creating: attack:1, defense:1, hp:5

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
      expect(player.hp).to eq 25
    end
  end
end 