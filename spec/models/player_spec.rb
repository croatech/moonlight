# == Schema Information
#
# Table name: players
#
#  id                  :integer          not null, primary key
#  name                :string
#  location_id         :integer
#  helmet_slot         :integer
#  armor_slot          :integer
#  mail_slot           :integer
#  gloves_slot         :integer
#  foots_slot          :integer
#  bracers_slot        :integer
#  belt_slot           :integer
#  weapon_slot         :integer
#  shield_slot         :integer
#  ring_slot           :integer
#  necklace_slot       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  gold                :integer          default(0)
#  attack              :integer          default(1)
#  defense             :integer          default(1)
#  hp                  :integer          default(20)
#  level               :integer          default(1)
#  exp                 :integer          default(0)
#  exp_next            :integer          default(100)
#  equipment           :string           default([]), is an Array
#  free_stats          :integer          default(10)
#  lumberjacking_skill :integer          default(0)
#  fishing_skill       :integer          default(0)
#  tools               :string           default([]), is an Array
#  lumberjacking_slot  :integer
#  fishing_slot        :integer
#  cloak_slot          :integer
#  pants_slot          :integer
#  current_hp          :integer
#  avatar_id           :integer
#

require 'spec_helper'

describe Player, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to belong_to(:location) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:avatar) }
  it { is_expected.to have_many(:fights) }
  it { is_expected.to have_many(:events) }
  it { is_expected.to have_many(:messages) }

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
