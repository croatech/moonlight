require 'spec_helper'

describe Stuff::SellService do
  subject do
    Stuff::SellService.call(player: player, item: item)
  end

  let(:location) { create(:location, name: 'Shop') }
  let(:player) { create(:player, gold: 0, location: location) }

  describe 'Success' do
    describe 'Equipment::Item' do
      let(:item) { create(:equipment_item) }
      let!(:stuff) { create(:stuff, player: player, stuffable: item) }

      describe 'success' do
        it 'check that service succeeded' do
          expect(subject.success?).to eq true
        end

        it 'check that service has not errors' do
          expect(subject.error).to be_nil
        end

        it 'checks that stuff is deleted' do
          expect { subject }.to change { player.stuffs.count }.from(1).to(0)
        end

        it 'checks that player has got money deposite' do
          expect { subject }.to change { player.gold }.from(0).to(item.sell_price)
        end
      end

      describe 'failure' do
        it 'checks failure if player has not an item' do
          stuff.delete
          expect(subject.failure?).to eq true
        end
      end
    end

    describe 'Tool::Item' do
      let(:item) { create(:tool_item) }
      let!(:stuff) { create(:stuff, player: player, stuffable: item) }

      describe 'success' do
        it 'check that service succeeded' do
          expect(subject.success?).to eq true
        end

        it 'check that service has not errors' do
          expect(subject.error).to be_nil
        end

        it 'checks that stuff is deleted' do
          expect { subject }.to change { player.stuffs.count }.from(1).to(0)
        end

        it 'checks that player has got money deposite' do
          expect { subject }.to change { player.gold }.from(0).to(item.sell_price)
        end
      end

      describe 'failure' do
        it 'checks failure if player has not an item' do
          stuff.delete
          expect(subject.failure?).to eq true
        end
      end
    end

    describe 'Resource' do
      let(:item) { create(:resource) }
      let!(:stuff) { create(:stuff, player: player, stuffable: item) }

      describe 'success' do
        it 'check that service succeeded' do
          expect(subject.success?).to eq true
        end

        it 'check that service has not errors' do
          expect(subject.error).to be_nil
        end

        it 'checks that stuff is deleted' do
          expect { subject }.to change { player.stuffs.count }.from(1).to(0)
        end

        it 'checks that player has got money deposite' do
          expect { subject }.to change { player.gold }.from(0).to(item.sell_price)
        end
      end

      describe 'failure' do
        it 'checks failure if player has not an item' do
          stuff.delete
          expect(subject.failure?).to eq true
        end
      end
    end
  end

  describe 'Fail' do
    context 'if player not in the Shop' do
      let!(:shop_location) { create(:location, name: 'Magic Shop') }
      let(:location) { create(:location, name: 'Some Cave') }
      let(:player) { create(:player, location: location) }
      let(:item) { create(:equipment_item) }
      let!(:stuff) { create(:stuff, player: player, stuffable: item) }

      it 'checks that service failed' do
        expect(subject.failure?).to be_truthy
      end

      it 'checks that service has a particular error' do
        expect(subject.error).to eq 'You can sell this item in the Magic Shop'
      end
    end
  end
end
