require 'rails_helper'

describe Player::Stats::IncreaseService do
  subject do
    Player::Stats::IncreaseService.call(player: player, stat: stat)
  end

  let(:player) { create(:player, free_stats: 10, attack: 0) }
  let(:stat) { 'attack' }

  describe 'successed incrementing' do
    it 'checks that service is successes' do
      expect(subject.success?).to be true
    end

    it 'checks that no error' do
      expect(subject.error).to be_nil
    end

    it 'checks that attack was incremented' do
      expect(subject.player.attack).to eq 1
    end

    it 'checks that free stats was decremented' do
      expect(subject.player.free_stats).to eq 9
    end
  end

  describe 'no free stats' do
    let(:player) { create(:player, free_stats: 0, attack: 0) }

    it 'checks that service is failed' do
      expect(subject.failure?).to be true
    end

    it 'checks that error has an error' do
      expect(subject.error).to include('No free stats')
    end

    it 'checks that attack was not incremented' do
      expect(subject.player.attack).to eq 0
    end

    it 'checks that free stats were not decremented' do
      expect(subject.player.free_stats).to eq 0
    end
  end

  describe 'incorrect stat' do
    let(:stat) { 'gold' }

    it 'checks that service is failed' do
      expect(subject.failure?).to be true
    end

    it 'checks that free stats were not decremented' do
      expect(subject.player.free_stats).to eq 10
    end
  end
end
