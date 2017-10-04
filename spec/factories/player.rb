FactoryGirl.define do
  factory :player do
    name 'Player'
    user
    current_hp 0
    hp 0
    attack 0
    defense 0
  end
end
