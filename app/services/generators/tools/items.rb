module Generators::Tools::Items
  def self.call
    Tool::Item.create!(
      [
        { name: 'Axe for a beech',           tool_category_id: Tool::Category.find_by(type: 'lumberjacking').id, price: 100,   required_skill: 0,   image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_beech.png") },
        { name: 'Axe for an elm',            tool_category_id: Tool::Category.find_by(type: 'lumberjacking').id, price: 200,   required_skill: 50,  image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_an_elm.png") },
        { name: 'Axe for a larch',           tool_category_id: Tool::Category.find_by(type: 'lumberjacking').id, price: 400,   required_skill: 100, image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_larch.png") },
        { name: 'Axe for a birch',           tool_category_id: Tool::Category.find_by(type: 'lumberjacking').id, price: 800,   required_skill: 150, image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_birch.png") },
        { name: 'Axe for a sequoia',         tool_category_id: Tool::Category.find_by(type: 'lumberjacking').id, price: 1600,  required_skill: 200, image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_sequoia.png") },
        { name: 'Axe for an eucalyptus',     tool_category_id: Tool::Category.find_by(type: 'lumberjacking').id, price: 3200,  required_skill: 250, image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_an_eucalyptus.png") },
        { name: 'Axe for a rowan',           tool_category_id: Tool::Category.find_by(type: 'lumberjacking').id, price: 6400,  required_skill: 300, image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_rowan.png") },
        { name: 'Axe for a mysterious wood', tool_category_id: Tool::Category.find_by(type: 'lumberjacking').id, price: 12800, required_skill: 350, image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_mysterious_wood.png") }
      ]
    )
  end
end
