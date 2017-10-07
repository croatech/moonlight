require 'rails_helper'

describe Api::Tools::ItemsController, type: :controller do
  let(:player) { create(:player, gold: 6, level: 6, lumberjacking_skill: 6, lumberjacking_slot: item.id) }
  let(:category) { create(:tool_category, type: 'lumberjacking') }
  let(:item) { create(:tool_item, price: 6, required_skill: 6, category: category) }
  let!(:stuff) { create(:stuff, player: player, stuffable: item) }

  describe 'POST #buy' do
    subject do
      post :buy, params: { item_id: item.id }
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

  describe 'POST #put_on' do
    subject do
      post :put_on, params: { item_id: item.id }
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

  describe 'POST #take_off' do
    subject do
      post :buy, params: { item_id: item.id }
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


  describe 'POST #sell' do
    subject do
      post :buy, params: { item_id: item.id }
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
