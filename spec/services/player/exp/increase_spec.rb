require 'spec_helper'

describe Player::Exp::IncreaseService do

  let(:user) { create(:user) }
  let(:player) { user.player }

  it 'checks zero exp after creating' do
    expect(player.exp).to eq 0
    expect(player.exp_next).to eq 100
  end

  it 'checks an increasing exp' do
    Player::Exp::IncreaseService.new(player, 50).call
    expect(player.exp).to eq 50
  end

  it 'checks an increasing exp after level up' do
    player.update_attribute(:exp, 80)
    Player::Exp::IncreaseService.new(player, 50).call
    expect(player.exp).to eq 30
    expect(player.exp_next).to eq 200
  end

  it 'checks an increasing level after level up' do
    player.update_attribute(:exp, 80)
    Player::Exp::IncreaseService.new(player, 50).call
    expect(player.level).to eq 2
  end

  it 'checks an increasing free stats after level up' do
    player.update_attribute(:exp, 80)
    Player::Exp::IncreaseService.new(player, 50).call
    expect(player.free_stats).to eq 20
  end

  it 'checks an increasing gold after level up' do
    player.update_attribute(:exp, 80)
    Player::Exp::IncreaseService.new(player, 50).call
    expect(player.gold).to eq 600
  end
end 