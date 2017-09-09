FactoryGirl.define do
  factory :equipment_item, class: Equipment::Item do
    name 'Axe'
    category factory: :equipment_category
    price 300
    required_level 1
  end
end
