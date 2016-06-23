require 'spec_helper'

describe Tool::Item::SellItemService do

  let(:user) { create(:user) }
  let(:player) { user.player }
  let(:item) { create(:tool_item, price: 100) }
  
  it 'checks the gold after sell' do
    Tool::Item::BuyItemService.new(player, item).call
    expect(player.gold).to eq 200
    Tool::Item::SellItemService.new(player, item).call
    expect(player.tools).to eq []
  end
end 