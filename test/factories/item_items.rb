FactoryGirl.define do
  factory :item_item, class: 'Item::Item' do
    name "MyString"
    category_id 1
    power 1
    defense 1
    hp 1
  end
end
