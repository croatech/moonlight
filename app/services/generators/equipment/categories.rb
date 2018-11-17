module Generators::Equipment::Categories
  def self.call
    ::Equipment::Category.create!(
      [
        { name: 'Helmet',   type: 'helmet' },
        { name: 'Armor',    type: 'armor' },
        { name: 'Mail',     type: 'mail' },
        { name: 'Gloves',   type: 'gloves' },
        { name: 'Bracers',  type: 'bracers' },
        { name: 'Shoes',    type: 'shoes' },
        { name: 'Belt',     type: 'belt' },
        { name: 'Weapon',   type: 'weapon' },
        { name: 'Shield',   type: 'shield' },
        { name: 'Ring',     type: 'ring' },
        { name: 'Necklace', type: 'necklace' },
        { name: 'Cloak',    type: 'cloak' },
        { name: 'Pants',    type: 'pants' }
      ]
    )
  end
end
