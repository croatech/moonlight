require 'rails_helper'

describe Api::Stuff::ItemsController, type: :controller do
  let(:location) { create(:location, name: 'Shop') }
  let(:player) { create(:player, gold: 6, level: 6, lumberjacking_skill: 6, lumberjacking_slot: item.id, location: location) }

  describe 'Equipment::Item' do
    let(:item) { create(:equipment_item, price: 6) }
    let!(:stuff) { create(:stuff, player: player, stuffable: item) }

    describe 'POST #buy' do
      subject do
        post :buy, params: { item_id: item.id, item_type: 'equipment' }
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
        post :put_on, params: { item_id: item.id, item_type: 'equipment' }
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
        post :take_off, params: { item_id: item.id, item_type: 'equipment' }
      end

      before do
        Stuff::PutOnService.call(player: player, item: item)
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
        post :sell, params: { item_id: item.id, item_type: 'equipment' }
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

  describe 'Tool::Item' do
    let(:item) { create(:tool_item, price: 6, required_skill: 6) }
    let!(:stuff) { create(:stuff, player: player, stuffable: item) }

    describe 'POST #buy' do
      subject do
        post :buy, params: { item_id: item.id, item_type: 'tool' }
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
        post :put_on, params: { item_id: item.id, item_type: 'tool' }
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
        post :buy, params: { item_id: item.id, item_type: 'tool' }
      end

      before do
        Stuff::PutOnService.call(player: player, item: item)
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
        post :sell, params: { item_id: item.id, item_type: 'tool' }
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

  describe 'Resource' do
    let(:item) { create(:resource, price: 6) }
    let!(:stuff) { create(:stuff, player: player, stuffable: item) }

    describe 'POST #buy' do
      subject do
        post :buy, params: { item_id: item.id, item_type: 'resource' }
      end

      context 'unathorized' do
        it 'checks that redirected' do
          expect(subject.status).to eq 302
        end
      end

      context 'authorized' do
        it 'checks that status is ok' do
          sign_in(player.user)
          expect(subject.status).to eq 404
        end
      end
    end

    describe 'POST #put_on' do
      subject do
        post :put_on, params: { item_id: item.id, item_type: 'resource' }
      end

      context 'unathorized' do
        it 'checks that redirected' do
          expect(subject.status).to eq 302
        end
      end

      context 'authorized' do
        it 'checks that status is ok' do
          sign_in(player.user)
          expect(subject.status).to eq 404
        end
      end
    end

    describe 'POST #take_off' do
      subject do
        post :buy, params: { item_id: item.id, item_type: 'resource' }
      end

      context 'unathorized' do
        it 'checks that redirected' do
          expect(subject.status).to eq 302
        end
      end

      context 'authorized' do
        it 'checks that status is ok' do
          sign_in(player.user)
          expect(subject.status).to eq 404
        end
      end
    end

    describe 'POST #sell' do
      subject do
        post :sell, params: { item_id: item.id, item_type: 'resource' }
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
end
