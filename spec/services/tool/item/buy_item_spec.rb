require 'spec_helper'

describe Tool::Item::BuyItemService do

  let(:user) { create(:user) }
  let(:player) { user.player }
  let(:item) { create(:tool_item, price: 100) }

  it 'checks gold after buy' do
    expect(player.gold).to eq 300
    Tool::Item::BuyItemService.new(player, item).call
    expect(player.gold).to eq 200
  end

  it 'checks inventory after buy' do
    expect(player.tools).to eq []
    Tool::Item::BuyItemService.new(player, item).call
    expect(player.tools).to eq [1]
  end
end 