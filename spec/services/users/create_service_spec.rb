require 'spec_helper'

describe Users::CreateService do
  subject do
    Users::CreateService.call(params: params)
  end

  context 'valid params' do
    let(:params) { { email: 'test@gmail.com', password: 'password', username: 'Cro' } }

    it 'check that service successed' do
      expect(subject.success?).to be_truthy
    end
  end
end
