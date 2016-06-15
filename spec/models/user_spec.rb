require 'spec_helper'

describe User do
  
  it 'checks profile observer' do
    user = create(:user)
    expect(user.profile.user_id).to eq user.id
  end
end