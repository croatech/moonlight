FactoryGirl.define do
  factory :tool_item, class: Tool::Item do
    name 'Axe for wood'
    category factory: :tool_category
    price 300
    required_skill 0
    type 'lumberjacking'
  end
end
