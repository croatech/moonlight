require 'spec_helper'

describe Fight::StartService do
  subject do
    Fight::StartService.call(player: player, bot: bot)
  end

  let(:player) { create :player }
  let(:bot) { create :bot }

  describe 'success' do
    it 'check that service succeeded' do
      expect(subject.success?).to be_truthy
    end

    it 'check that service creates an active fight' do
      expect { subject }.to change { player.active_fight.present? }.from(false).to(true)
    end

    it 'check that service gives an object wiht fight_id and round_id' do
      expect(subject.object).to eq({ fight_id: player.active_fight.id, round_id: player.active_fight.rounds.first.id })
    end
  end

  describe 'failure' do
    let!(:fight) { player.fights.create(bot: bot) }

    it 'checks that service failed' do
      expect(subject.failure?).to be_truthy
    end

    it 'checks that service has particular error' do
      expect(subject.error).to eq('Player has an active fight')
    end
  end
end
