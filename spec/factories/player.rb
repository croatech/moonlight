FactoryGirl.define do
  factory :player do
    sequence(:name) { |n| "#{n}Name" }
    user
    current_hp 0
    hp 0
    attack 0
    defense 0
    location
  end
end
