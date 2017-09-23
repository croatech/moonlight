require 'rails_helper'

describe Api::Tools::ItemsController, type: :controller do
  let(:player) { create(:player, gold: 6, level: 6, lumberjacking_skill: 6) }
  let(:item) { create(:tool_item, price: 6, required_skill: 6, type: 'lumberjacking') }

  describe 'PATCH #buy' do
    subject do
      patch :buy, params: { item_id: item.id }
    end

    context 'unathorized' do
      it 'checks that redirected' do
        expect(subject.status).to eq 302
      end
    end

    context 'authorized' do
      it 'checks that status is ok' do
        sign_in(player.user)
        expect(subject.status).to eq 200
      end
    end
  end
end
