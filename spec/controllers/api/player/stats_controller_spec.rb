require 'rails_helper'

describe Api::Player::StatsController, type: :controller do
  let(:player) { create(:player, free_stats: 1) }

  describe 'PATCH #increase' do
    subject do
      patch :increase, params: { stat_id: 'attack' }
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