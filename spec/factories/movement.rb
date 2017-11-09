FactoryGirl.define do
  factory :movement do
    player
    path [1,2]
    status 'completed'
  end
end