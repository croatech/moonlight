module Generators::Resources::Lumberjacking
  def self.call
    Resource.create!(
      [
        { name: 'Beech',           item_id: Tool::Item.find_by(name: 'Axe for a beech').id,           price: 10, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/beech.png") },
        { name: 'Elm',             item_id: Tool::Item.find_by(name: 'Axe for an elm').id,            price: 20, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/elm.png") },
        { name: 'Larch',           item_id: Tool::Item.find_by(name: 'Axe for a larch').id,           price: 30, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/larch.png") },
        { name: 'Birch',           item_id: Tool::Item.find_by(name: 'Axe for a birch').id,           price: 40, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/birch.png") },
        { name: 'Sequoia',         item_id: Tool::Item.find_by(name: 'Axe for a sequoia').id,         price: 50, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/sequoia.png") },
        { name: 'Eucalyptus',      item_id: Tool::Item.find_by(name: 'Axe for an eucalyptus').id,     price: 60, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/eucalyptus.png") },
        { name: 'Rowan',           item_id: Tool::Item.find_by(name: 'Axe for a rowan').id,           price: 70, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/rowan.png") },
        { name: 'Mysterious wood', item_id: Tool::Item.find_by(name: 'Axe for a mysterious wood').id, price: 80, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/mysterious_wood.png") }
      ]
    )
  end
end
