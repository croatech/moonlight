require 'spec_helper'

describe User do
  
  it 'checks player observer' do
    user = create(:user)
    expect(user.player.user_id).to eq user.id
  end
end