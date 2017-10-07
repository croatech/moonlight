require 'rails_helper'

describe Api::ResourcesController, type: :controller do
  let(:player) { create(:player) }
  let(:item) { create(:resource) }
  let!(:stuff) { create(:stuff, player: player, stuffable: item) }

  describe 'POST #sell' do
    subject do
      post :sell, params: { resource_id: item.id }
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
