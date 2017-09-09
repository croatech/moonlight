FactoryGirl.define do
  factory :user do
    sequence :email {|n| "test-#{n}@gmail.com"}
    password  'password'
    name 'Test'
  end
end