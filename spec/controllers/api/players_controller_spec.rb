require 'rails_helper'

describe Api::PlayersController, type: :controller do
  let(:player) { create(:player) }

  describe 'GET #current' do
    subject do
      get :current
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