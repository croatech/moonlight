require 'spec_helper'

describe Locations::CheckForShopLocationService do
  let!(:shop_location) { create(:location, name: 'Magic Shop') }
  let(:location) { create(:location, name: 'Some Cave') }
  let(:player) { create(:player, location: location) }

  subject do
    Locations::CheckForShopLocationService.call(player: player)
  end

  describe 'call' do
    context 'player outside of shop location' do
      it 'checks that service failed' do
        expect(subject.failure?).to be_truthy
      end

      it 'checks that service has a particular error' do
        expect(subject.error).to eq 'You can sell this item in the Magic Shop'
      end
    end

    context 'player inside a shop location' do
      let(:location) { create(:location, name: 'Some Shop') }

      it 'checks that service succeeded' do
        expect(subject.success?).to be_truthy
      end
    end
  end

  describe 'shop_names' do
    subject do
      Locations::CheckForShopLocationService.new(player: player)
    end

    it 'checks that shop_names return an array with Shops' do
      expect(subject.send(:shop_names)).to eq(['Magic Shop'])
    end
  end
end
