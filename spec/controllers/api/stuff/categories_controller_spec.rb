require 'rails_helper'

describe Api::Stuff::CategoriesController, type: :controller do
  let(:player) { create(:player) }

  describe 'Equipment::Item(main)' do
    describe 'GET #index' do
      subject do
        get :index, params: { category_type: 'equipment' }
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

  describe 'Equipment::Item(artifacts)' do
    describe 'GET #index' do
      subject do
        get :index, params: { category_type: 'artifacts' }
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
    describe 'GET #index' do
      subject do
        get :index, params: { category_type: 'tool' }
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
