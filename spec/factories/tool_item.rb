FactoryGirl.define do
  factory :tool_item, class: Tool::Item do
    name 'Axe'
    category_id 1
    price 300
    required_skill 0
    type 'lumberjacking'
  end
end