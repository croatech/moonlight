# USERS #
User.create!(email: 'admin@gmail.com', password: 'password')
Player.first.increment!(:gold, 5555)
# LOCATIONS #
Location.create!(name: 'Moon Light',    slug: 'moon_light')
Location.create! [{name: 'Weapon Shop',   slug: 'weapon_shop', parent_id: Location.find_by(slug: 'moon_light').id},
                  {name: 'Craft Shop',    slug: 'craft_shop',  parent_id: Location.find_by(slug: 'moon_light').id},
                  {name: 'Wayward Pines', slug: 'wayward_pines'}]

64.times do |t|
  location_name = "#{t} cell"

  case t + 1
  when 20, 21
    location_name = 'Northern Forest'
  when 22
    location_name = 'Mycelium'
  when 28
    location_name = 'Dalf Lagoon'
  when 29, 36
    location_name = 'Sacred Forest'
  when 37
    location_name = 'Shady Walk'
  when 44
    location_name = 'South Thicket'
  when 45
    location_name = 'River Fork'
  when 53
    location_name = 'Dangerous Grounds'
  end

  Location.create!(name: "#{location_name}", slug: "#{t+1}", parent_id: Location.find_by(slug: 'wayward_pines').id, cell: true)
end

# EQUIPMENT
## CATEGORIES
Equipment::Category.create! [{name: 'Helmet',   slug: 'helmet'},
                             {name: 'Armor',    slug: 'armor'},
                             {name: 'Mail',     slug: 'mail'},
                             {name: 'Gloves',   slug: 'gloves'},
                             {name: 'Bracers',  slug: 'bracers'},
                             {name: 'Foots',    slug: 'foots'},
                             {name: 'Belt',     slug: 'belt'},
                             {name: 'Weapon',   slug: 'weapon'},
                             {name: 'Shield',   slug: 'shield'},
                             {name: 'Ring',     slug: 'ring'},
                             {name: 'Necklace', slug: 'necklace'},
                             {name: 'Cloak',    slug: 'cloak'},
                             {name: 'Pants',    slug: 'pants'}]

## ITEMS
### HELMET
Equipment::Item.create! [{name: 'Leather hat',      category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 10, hp: 10,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/leather_hat.png")},
                         {name: 'Bone helm',        category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 10, hp: 20,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/bone_helm.png")},
                         {name: 'Scary mask',       category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 15, hp: 30,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/scary_mask.png")},
                         {name: 'Bloody helm',      category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 20, hp: 40,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/bloody_helm.png")},
                         {name: 'Gold helm',        category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 25, hp: 50,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/gold_helm.png")},
                         {name: 'Wiking helm',      category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 30, hp: 60,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/wiking_helm.png")},
                         {name: 'Mithrill helm',    category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 35, hp: 70,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/mithrill_helm.png")},
                         {name: 'Shell helm',       category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 40, hp: 80,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/shell_helm.png")},
                         {name: 'Holy helm',        category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 45, hp: 90,  required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/holy_helm.png")},
                         {name: 'Streamlined helm', category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 50, hp: 100, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/streamlined_helm.png")}]
### CHEST
Equipment::Item.create! [{name: 'Leather armor',   category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 10, hp: 20,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/leather_armor.png")},
                         {name: 'Bright armor',    category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 15, hp: 30,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/bright_armor.png")},
                         {name: 'Scary armor',     category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 20, hp: 40,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/scary_armor.png")},
                         {name: 'Kvark armor',     category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 25, hp: 50,  required_level: 4,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/kvark_armor.png")},
                         {name: 'Gold armor',      category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 30, hp: 60,  required_level: 5,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/gold_armor.png")},
                         {name: 'Centuri armor',   category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 35, hp: 70,  required_level: 6,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/centuri_armor.png")},
                         {name: 'Sea armor',       category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 40, hp: 80,  required_level: 7,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/sea_armor.png")},
                         {name: 'Blueberry armor', category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 45, hp: 90,  required_level: 8,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/blueberry_armor.png")},
                         {name: 'Holy armor',      category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 50, hp: 100, required_level: 9,  price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/holy_armor.png")},
                         {name: 'Elite armor',     category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 55, hp: 110, required_level: 10, price: 550, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/elite_armor.png")}]
### MAIL
Equipment::Item.create! [{name: 'Fur Vest',       category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 10, hp: 20,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/fur_vest.png")},
                         {name: 'Slinky mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 15, hp: 30,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/slinky_mail.png")},
                         {name: 'Binded mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 20, hp: 40,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/binded_mail.png")},
                         {name: 'Assasin jacket', category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 25, hp: 50,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/assasin_jacket.png")},
                         {name: 'Metal mail',     category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 30, hp: 60,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/metal_mail.png")},
                         {name: 'Steel mail',     category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 35, hp: 70,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/steel_mail.png")},
                         {name: 'Copper mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 40, hp: 80,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/copper_mail.png")},
                         {name: 'Sacred mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 45, hp: 90,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/sacred_mail.png")},
                         {name: 'Kvark mail',     category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 50, hp: 100, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/kvark_mail.png")},
                         {name: 'Earl mail',      category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 55, hp: 110, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/earl_mail.png")}]
### GLOVES
Equipment::Item.create! [{name: 'Leather Gloves',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 0,  defense: 10, hp: 20,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/leather_gloves.png")},
                         {name: 'Elastic Gloves',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 2,  defense: 15, hp: 30,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/elastic_gloves.png")},
                         {name: 'Rubber Gloves',   category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 4,  defense: 20, hp: 40,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/rubber_gloves.png")},
                         {name: 'Gloves of Rogue', category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 6,  defense: 25, hp: 50,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/gloves_of_rogue.png")},
                         {name: 'Spiked Gloves',   category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 8,  defense: 30, hp: 60,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/spiked_gloves.png")},
                         {name: 'Steel Gloves',    category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 12, defense: 35, hp: 70,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/steel_gloves.png")},
                         {name: 'Emerald Gloves',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 14, defense: 40, hp: 80,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/emerald_gloves.png")},
                         {name: 'Titan Gloves',    category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 16, defense: 45, hp: 90,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/titan_gloves.png")},
                         {name: 'Executor Gloves', category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 18, defense: 50, hp: 100, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/executor_gloves.png")},
                         {name: 'Hedgehog Gloves', category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 20, defense: 55, hp: 110, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/hedgehog_gloves.png")}]
### BRACERS
Equipment::Item.create! [{name: 'Leather Bracers',     category_id: Equipment::Category.find_by(slug: 'bracers').id,    attack: 0,  defense: 5,  hp: 10,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/leather_bracers.png")},
                         {name: 'Straw bracers',       category_id: Equipment::Category.find_by(slug: 'bracers').id,   attack: 1,  defense: 15, hp: 30,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/straw_bracers.png")},
                         {name: 'Light bracers',       category_id: Equipment::Category.find_by(slug: 'bracers').id,   attack: 2,  defense: 20, hp: 40,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/light_bracers.png")},
                         {name: 'Elefant bracers',     category_id: Equipment::Category.find_by(slug: 'bracers').id,   attack: 3,  defense: 25, hp: 50,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/elefant_bracers.png")},
                         {name: 'Emerald bracers',     category_id: Equipment::Category.find_by(slug: 'bracers').id,   attack: 4,  defense: 30, hp: 60,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/emerald_bracers.png")},
                         {name: 'Golden bracers',      category_id: Equipment::Category.find_by(slug: 'bracers').id,   attack: 5,  defense: 35, hp: 70,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/golden_bracers.png")},
                         {name: 'Spiked bracers',      category_id: Equipment::Category.find_by(slug: 'bracers').id,   attack: 6,  defense: 40, hp: 80,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/spiked_bracers.png")},
                         {name: 'Holy bracers',        category_id: Equipment::Category.find_by(slug: 'bracers').id,   attack: 7,  defense: 45, hp: 90,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/holy_bracers.png")},
                         {name: 'Titan bracers',       category_id: Equipment::Category.find_by(slug: 'bracers').id,   attack: 8,  defense: 50, hp: 100, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/titan_bracers.png")},
                         {name: 'Unbreakable bracers', category_id: Equipment::Category.find_by(slug: 'bracers').id,   attack: 10, defense: 55, hp: 110, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/unbreakable_bracers.png")}]
### SHOES
Equipment::Item.create! [{name: 'Leather boots',      category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 0,  defense: 5,  hp: 10,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/leather_boots.png")},
                         {name: 'Straw shoes',        category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 3,  defense: 15, hp: 30,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/straw_shoes.png")},
                         {name: 'Magic Boots',        category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 6,  defense: 20, hp: 40,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/magic_boots.png")},
                         {name: 'Boots of Manticore', category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 9,  defense: 25, hp: 50,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/boots_of_manticore.png")},
                         {name: 'Ancient boots',      category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 12, defense: 30, hp: 60,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/ancient_boots.png")},
                         {name: 'Boots of Executor',  category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 15, defense: 35, hp: 70,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/boots_of_executor.png")},
                         {name: 'Spiked boots',       category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 18, defense: 40, hp: 80,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/spiked_boots.png")},
                         {name: 'Holy boots',         category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 21, defense: 45, hp: 90,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/holy_boots.png")},
                         {name: 'Titan boots',        category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 24, defense: 50, hp: 100, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/titan_boots.png")},
                         {name: 'Kvark boots',        category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 26, defense: 55, hp: 110, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/kvark_boots.png")}]
### BELT
Equipment::Item.create! [{name: 'Rag belt', category_id: Equipment::Category.find_by(slug: 'belt').id,   attack: 0, defense: 5, hp: 10, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/rag_belt.png")}]
### WEAPON
Equipment::Item.create! [{name: 'Metal axe',     category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 10,  defense: 0,  hp: 0, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/metal_axe.png")}]
### SHIELD
Equipment::Item.create! [{name: 'Wood shield',   category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0,  defense: 20, hp: 30, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/wood_shield.png")}]
### RING
Equipment::Item.create! [{name: 'Wood ring',   category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 5,  defense: 5, hp: 5, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/wood_ring.png")}]
### NECKLACE
Equipment::Item.create! [{name: 'Bone necklace',   category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,  defense: 5, hp: 5, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/bone_necklace.png")}]
### CLOAK
Equipment::Item.create! [{name: 'Tramp cloak',     category_id: Equipment::Category.find_by(slug: 'cloak').id, attack: 0,  defense: 5,  hp: 10,   required_level: 1,  price: 50,    image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/tramp_cloak.png")},
                         {name: 'Gilded cloak',    category_id: Equipment::Category.find_by(slug: 'cloak').id, attack: 0,  defense: 10, hp: 20,   required_level: 5,  price: 500,   image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/gilded_cloak.png")},
                         {name: 'Dementor cloak',  category_id: Equipment::Category.find_by(slug: 'cloak').id, attack: 0,  defense: 20, hp: 40,   required_level: 10, price: 2500,  image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/dementor_cloak.png")},
                         {name: 'Snake cloak',     category_id: Equipment::Category.find_by(slug: 'cloak').id, attack: 0,  defense: 40, hp: 50,   required_level: 15, price: 5000,  image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/snake_cloak.png")},
                         {name: 'Cape of Croaton', category_id: Equipment::Category.find_by(slug: 'cloak').id, attack: 20, defense: 80, hp: 500,  required_level: 5,  price: 50000, image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/art/cape_of_croaton.png"), artifact: true}]
### PANTS
Equipment::Item.create! [{name: 'Leather pants',  category_id: Equipment::Category.find_by(slug: 'pants').id, attack: 0,  defense: 5, hp: 5,   required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/pants/leather_pants.png")},
                         {name: 'Spectral pants', category_id: Equipment::Category.find_by(slug: 'pants').id, attack: 0,  defense: 50, hp: 50, required_level: 5, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/pants/spectral_pants.png")}]


# TOOLS
## CATEGORIES
Tool::Category.create! [{name: 'Lumberjacking', slug: 'lumberjacking'},
                        {name: 'Fishing',       slug: 'fishing'}]

## ITEMS
### LUMBERJACKING
Tool::Item.create! [{id: 1, name: 'Axe for a beech',           category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 100,   required_skill: 0,     type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_beech.png")},
                    {id: 2, name: 'Axe for an elm',            category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 200,   required_skill: 50,    type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_an_elm.png")},
                    {id: 3, name: 'Axe for a larch',           category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 400,   required_skill: 100,   type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_larch.png")},
                    {id: 4, name: 'Axe for a birch',           category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 800,   required_skill: 150,   type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_birch.png")},
                    {id: 5, name: 'Axe for a sequoia',         category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 1600,  required_skill: 200,   type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_sequoia.png")},
                    {id: 6, name: 'Axe for an eucalyptus',     category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 3200,  required_skill: 250,   type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_an_eucalyptus.png")},
                    {id: 7, name: 'Axe for a rowan',           category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 6400,  required_skill: 300,   type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_rowan.png")},
                    {id: 8, name: 'Axe for a mysterious wood', category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 12800, required_skill: 350,   type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_mysterious_wood.png")}]

# RESOURCES
## LUMBERJACKING
Resource.create! [{name: 'Beech',           item_id: Tool::Item.find_by(name: 'Axe for a beech').id,           price: 10, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/beech.png")},
                  {name: 'Elm',             item_id: Tool::Item.find_by(name: 'Axe for an elm').id,            price: 20, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/elm.png")},
                  {name: 'Larch',           item_id: Tool::Item.find_by(name: 'Axe for a larch').id,           price: 30, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/larch.png")},
                  {name: 'Birch',           item_id: Tool::Item.find_by(name: 'Axe for a birch').id,           price: 40, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/birch.png")},
                  {name: 'Sequoia',         item_id: Tool::Item.find_by(name: 'Axe for a sequoia').id,         price: 50, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/sequoia.png")},
                  {name: 'Eucalyptus',      item_id: Tool::Item.find_by(name: 'Axe for an eucalyptus').id,     price: 60, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/eucalyptus.png")},
                  {name: 'Rowan',           item_id: Tool::Item.find_by(name: 'Axe for a rowan').id,           price: 70, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/rowan.png")},
                  {name: 'Mysterious wood', item_id: Tool::Item.find_by(name: 'Axe for a mysterious wood').id, price: 80, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/mysterious_wood.png")}]

# POPULATE RESOURCES
## LUMBERJACKING
### MULTIPLE CELLS
Location.where(name: 'Sacred Forest').each do |location|
  LocationResource.create! [{location_id: location.id, resource_id: Resource.find_by(name: 'Beech').id},
                            {location_id: location.id, resource_id: Resource.find_by(name: 'Elm').id}]
end

Location.where(name: 'Northern Forest').each do |location|
  LocationResource.create!(location_id: location.id, resource_id: Resource.find_by(name: 'Birch').id)
end

### SINGLE CELLS
LocationResource.create!(location_id: Location.find_by(name: 'Dalf Lagoon').id,       resource_id: Resource.find_by(name: 'Larch').id)
LocationResource.create!(location_id: Location.find_by(name: 'Mycelium').id,          resource_id: Resource.find_by(name: 'Sequoia').id)
LocationResource.create!(location_id: Location.find_by(name: 'South Thicket').id,     resource_id: Resource.find_by(name: 'Eucalyptus').id)
LocationResource.create!(location_id: Location.find_by(name: 'River Fork').id,        resource_id: Resource.find_by(name: 'Rowan').id)
LocationResource.create!(location_id: Location.find_by(name: 'Dangerous Grounds').id, resource_id: Resource.find_by(name: 'Mysterious wood').id)

# BOTS
Bot.create! [{level: 1, name: 'Armillaria',  attack: 10, defense: 10, hp: 100, image: File.new("#{Rails.root}/db/seeds/bots/armillaria.jpg")},
             {level: 2, name: 'Chanterelle', attack: 20, defense: 20, hp: 200, image: File.new("#{Rails.root}/db/seeds/bots/chanterelle.jpg")},
             {level: 3, name: 'Amanita',     attack: 30, defense: 30, hp: 300, image: File.new("#{Rails.root}/db/seeds/bots/amanita.jpg")},
             {level: 4, name: 'Rat',         attack: 40, defense: 40, hp: 400, image: File.new("#{Rails.root}/db/seeds/bots/rat.jpg")},
             {level: 5, name: 'Spider',      attack: 50, defense: 50, hp: 500, image: File.new("#{Rails.root}/db/seeds/bots/spider.jpg")},
             {level: 6, name: 'Hoblin',      attack: 60, defense: 60, hp: 600, image: File.new("#{Rails.root}/db/seeds/bots/hoblin.jpg")},
             {level: 7, name: 'Ork',         attack: 70, defense: 70, hp: 700, image: File.new("#{Rails.root}/db/seeds/bots/ork.jpg")},
             {level: 8, name: 'Drowned',     attack: 80, defense: 80, hp: 800, image: File.new("#{Rails.root}/db/seeds/bots/drowned.jpg")}]

# POPULATE BOTS
## MULTIPLE CELLS
Location.where(name: 'Sacred Forest').each do |location|
  LocationBot.create! [{location_id: location.id, bot_id: Bot.find_by(name: 'Hoblin').id},
                       {location_id: location.id, bot_id: Bot.find_by(name: 'Ork').id}]
end

## SINGLE CELLS
LocationBot.create! [{location_id: Location.find_by(name: 'Mycelium').id,    bot_id: Bot.find_by(name: 'Armillaria').id},
                     {location_id: Location.find_by(name: 'Mycelium').id,    bot_id: Bot.find_by(name: 'Chanterelle').id},
                     {location_id: Location.find_by(name: 'Mycelium').id,    bot_id: Bot.find_by(name: 'Amanita').id},
                     {location_id: Location.find_by(name: 'Shady Walk').id,  bot_id: Bot.find_by(name: 'Rat').id},
                     {location_id: Location.find_by(name: 'Shady Walk').id,  bot_id: Bot.find_by(name: 'Spider').id},
                     {location_id: Location.find_by(name: 'Dalf Lagoon').id, bot_id: Bot.find_by(name: 'Drowned').id}]
