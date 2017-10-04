FactoryGirl.define do
  factory :stuff do
    player
    stuffable factory: :equipment_item
  end
end