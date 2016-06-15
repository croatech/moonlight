require 'spec_helper'

describe Profile do


  let(:user) { create(:user) }
  let(:profile) { user.profile }

  context 'stats' do
    # default after creating: attack:1, defense:1, hp:5

    it 'checks increasing of attack' do
      profile.increase_attack
      expect(profile.attack).to eq 2
    end

    it 'checks increasing of defense' do
      profile.increase_defense
      expect(profile.defense).to eq 2
    end

    it 'checks increasing of hp' do
      profile.increase_hp
      expect(profile.hp).to eq 25
    end
  end
end