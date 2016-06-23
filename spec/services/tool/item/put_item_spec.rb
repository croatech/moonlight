require 'spec_helper'

describe Player::Inventory::Tool::Put::OnService do

  let(:user) { create(:user) }
  let(:player) { user.player }
  let(:item) { create(:tool_item, price: 100, type: 'lumberjacking') }
  let(:second_item) { create(:tool_item, required_skill: 10) }

  it 'checks the tools array' do
    expect(player.tools).to eq []
  end

  context 'put on' do
    it 'checks if an item didnt purchase' do
      Player::Inventory::Tool::Put::OnService.new(player, item).call
      expect(player.tools).to eq []
    end

    it 'checks if the required skill too high' do
      Tool::Item::BuyItemService.new(player, second_item).call
      Player::Inventory::Tool::Put::OnService.new(player, second_item).call
      expect(player.tools).to eq []
    end
  end
end 