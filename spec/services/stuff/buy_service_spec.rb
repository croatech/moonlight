require 'spec_helper'

describe Stuff::BuyService do
  subject do
    Stuff::BuyService.new.call(player: player, item: item)
  end

  let(:object) { subject.right }
  let(:errors) { subject.left }

  let(:player) { create(:player, gold: 6, level: 6, lumberjacking_skill: 50) }

  describe 'Equipment::Item' do
    let(:item) { create(:equipment_item, price: 6, required_level: 6) }

    describe 'success' do
      it 'check that service succeeded' do
        expect(subject.success?).to eq true
      end

      it 'check that service has not errors' do
        expect(errors).to be_nil
      end
    end

    describe 'gold' do
      context 'not enough' do
        let(:player) { create(:player, gold: 0, level: 6) }

        it 'check that service failed' do
          expect(subject.failure?).to eq true
        end

        it 'check that service has errors' do
          expect(errors).not_to be_nil
        end

        it 'checks that service has particular error' do
          expect(errors).to include('Gold is not enough')
        end
      end
    end

    describe 'level' do
      context 'not enough' do
        let(:player) { create(:player, level: 1, gold: 6) }

        it 'check that service failed' do
          expect(subject.failure?).to eq true
        end

        it 'check that service has errors' do
          expect(errors).not_to be_nil
        end

        it 'checks that service has particular error' do
          expect(errors).to include('Level or skill is not enough')
        end
      end
    end
  end

  describe 'Tool::Item' do
    let(:category) { create(:tool_category, type: 'lumberjacking') }
    let(:item) { create(:tool_item, price: 6, required_skill: 6, category: category) }

    describe 'success' do
      it 'check that service succeeded' do
        expect(subject.success?).to eq true
      end

      it 'check that service has not errors' do
        expect(errors).to be_nil
      end
    end

    describe 'gold' do
      context 'not enough' do
        let(:player) { create(:player, gold: 0, lumberjacking_skill: 50) }

        it 'check that service failed' do
          expect(subject.failure?).to eq true
        end

        it 'check that service has errors' do
          expect(errors).not_to be_nil
        end

        it 'checks that service has particular error' do
          expect(errors).to include('Gold is not enough')
        end
      end
    end

    describe 'skill' do
      context 'not enough' do
        let(:player) { create(:player, gold: 50, lumberjacking_skill: 1) }

        it 'check that service failed' do
          expect(subject.failure?).to eq true
        end

        it 'check that service has errors' do
          expect(errors).not_to be_nil
        end

        it 'checks that service has particular error' do
          expect(errors).to include('Level or skill is not enough')
        end
      end
    end
  end
end
