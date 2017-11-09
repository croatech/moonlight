FactoryGirl.define do
  factory :location_location do
    location
    near_location factory: :location
  end
end