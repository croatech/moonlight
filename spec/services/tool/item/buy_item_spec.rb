require 'spec_helper'

describe Tool::Item::BuyItemService do

  let(:user) { create(:user) }
  let(:player) { user.player }
  let(:item) { create(:tool_item, price: 100) }
  let(:second_item) { create(:tool_item, required_skill: 50) }

  it 'checks the gold after buy' do
    expect(player.gold).to eq 300
    Tool::Item::BuyItemService.new(player, item).call
    expect(player.gold).to eq 200
  end

  it 'checks an inventory after buy' do
    expect(player.tools).to eq []
    Tool::Item::BuyItemService.new(player, item).call
    expect(player.tools).to eq [1]
  end

  it 'checks if the skill level uncorrect' do
    Tool::Item::BuyItemService.new(player, second_item).call
    expect(player.gold).to eq 300
    expect(player.tools).to eq []
  end
end 