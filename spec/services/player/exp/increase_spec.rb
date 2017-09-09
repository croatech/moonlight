require 'spec_helper'

describe Player::Exp::IncreaseService do
  let(:player) { create(:player, exp: 100) }

  subject do
    Player::Exp::IncreaseService.new(player, 50).call
  end

  let(:object) { subject.player }

  it 'checks an increasing exp' do
    expect(object.exp).to eq 50
  end

  context 'level up' do
    let(:player) { create(:player, exp: 80, gold: 1500) }

    it 'checks an increasing exp after level up' do
      expect(object.exp).to eq 30
      expect(object.exp_next).to eq 200
    end

    it 'checks an increasing level after level up' do
      expect(object.level).to eq 2
    end

    it 'checks an increasing free stats after level up' do
      expect(object.free_stats).to eq 20
    end

    it 'checks an increasing gold after level up' do
      expect(object.gold).to eq 1800
    end
  end
end
