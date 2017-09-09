require 'spec_helper'

describe Player, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to belong_to(:location) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:avatar) }
  it { is_expected.to have_many(:fights) }
  it { is_expected.to have_many(:logs) }

  describe 'stats increasing' do
    let(:player) { create(:player, attack: 1, defense: 1, hp: 5) }

    context 'increase_attack' do
      it 'checks that successed' do
        player.increase_attack
        expect(player.attack).to eq 2
      end
    end

    context 'increase_defense' do
      it 'checks that successed' do
        player.increase_defense
        expect(player.defense).to eq 2
      end
    end

    context 'increase_hp' do
      it 'checks that successed' do
        player.increase_hp
        expect(player.hp).to eq 10
      end
    end
  end
end
