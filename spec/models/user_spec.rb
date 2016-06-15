require 'spec_helper'

describe User do
  
  it 'checks profile observer' do
    user = User.create(email: 'test@gmail.com', password: 'password')
    expect(user.profile.user_id).to eq user.id
  end

end