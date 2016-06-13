require 'spec_helper'

describe User do
  
  it 'checks character observer' do
    user = User.create(email: 'test@gmail.com', password: 'password')
    expect(user.character.user_id).to eq user.id
  end

end