# USERS #
User.create!(email: 'admin@gmail.com', password: 'password')
Player.first.increment!(:gold, 5555)
# LOCATIONS #
Location.create!(name: 'Moon Light',          slug: 'moon_light')
Location.create! [{name: 'Weapon Shop',       slug: 'weapon_shop',       parent_id: Location.find_by(slug: 'moon_light').id},
                  {name: 'Craft Shop',        slug: 'craft_shop',        parent_id: Location.find_by(slug: 'moon_light').id},
                  {name: 'Shop of Artifacts', slug: 'shop_of_artifacts', parent_id: Location.find_by(slug: 'moon_light').id},
                  {name: 'Wayward Pines',     slug: 'wayward_pines'}]

64.times do |t|
  location_name = "#{t} cell"

  case t + 1
  when 20, 21 then location_name = 'Northern Forest'
  when 22     then location_name = 'Mycelium'
  when 28     then location_name = 'Dalf Lagoon'
  when 29, 36 then location_name = 'Sacred Forest'
  when 37     then location_name = 'Shady Walk'
  when 44     then location_name = 'South Thicket'
  when 45     then location_name = 'River Fork'
  when 53     then location_name = 'Dangerous Grounds'
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

  ## NORMAL ITEMS
    ### HELMET
    Equipment::Item.create! [{name: 'Leather hat',      category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 6,  hp: 6,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/leather_hat.png")},
                             {name: 'Bone helm',        category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 10, hp: 12, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/bone_helm.png")},
                             {name: 'Scary mask',       category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 15, hp: 16, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/scary_mask.png")},
                             {name: 'Bloody helm',      category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 20, hp: 20, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/bloody_helm.png")},
                             {name: 'Gold helm',        category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 25, hp: 24, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/gold_helm.png")},
                             {name: 'Wiking helm',      category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 30, hp: 29, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/wiking_helm.png")},
                             {name: 'Mithrill helm',    category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 35, hp: 35, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/mithrill_helm.png")},
                             {name: 'Shell helm',       category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 40, hp: 44, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/shell_helm.png")},
                             {name: 'Holy helm',        category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 45, hp: 51, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/holy_helm.png")},
                             {name: 'Streamlined helm', category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 50, hp: 55, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/streamlined_helm.png")}] 
    ### CHEST
    Equipment::Item.create! [{name: 'Leather armor',   category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 10, hp: 20,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/leather_armor.png")},
                             {name: 'Bright armor',    category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 5,  hp: 15,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/bright_armor.png")},
                             {name: 'Scary armor',     category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 11, hp: 20,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/scary_armor.png")},
                             {name: 'Kvark armor',     category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 16, hp: 24,  required_level: 4,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/kvark_armor.png")},
                             {name: 'Gold armor',      category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 20, hp: 29,  required_level: 5,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/gold_armor.png")},
                             {name: 'Centuri armor',   category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 27, hp: 35,  required_level: 6,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/centuri_armor.png")},
                             {name: 'Sea armor',       category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 30, hp: 44,  required_level: 7,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/sea_armor.png")},
                             {name: 'Blueberry armor', category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 34, hp: 51,  required_level: 8,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/blueberry_armor.png")},
                             {name: 'Holy armor',      category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 39, hp: 55,  required_level: 9,  price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/holy_armor.png")},
                             {name: 'Elite armor',     category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 45, hp: 60, required_level: 10, price: 550, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/elite_armor.png")}]
    ### MAIL
    Equipment::Item.create! [{name: 'Fur Vest',       category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 10, hp: 20,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/fur_vest.png")},
                             {name: 'Slinky mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 5,  hp: 15,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/slinky_mail.png")},
                             {name: 'Binded mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 11, hp: 20,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/binded_mail.png")},
                             {name: 'Assasin jacket', category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 16, hp: 24,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/assasin_jacket.png")},
                             {name: 'Metal mail',     category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 20, hp: 29,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/metal_mail.png")},
                             {name: 'Steel mail',     category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 27, hp: 35,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/steel_mail.png")},
                             {name: 'Copper mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 30, hp: 44,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/copper_mail.png")},
                             {name: 'Sacred mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 34, hp: 51,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/sacred_mail.png")},
                             {name: 'Kvark mail',     category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 39, hp: 55,  required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/kvark_mail.png")},
                             {name: 'Earl mail',      category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 45, hp: 60, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/earl_mail.png")}]
    ### GLOVES
    Equipment::Item.create! [{name: 'Leather gloves',  category_id: Equipment::Category.find_by(slug: 'gloves').id, attack: 0,  defense: 10, hp: 20,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/leather_gloves.png")},
                             {name: 'Elastic gloves',  category_id: Equipment::Category.find_by(slug: 'gloves').id, attack: 2,  defense: 5,  hp: 15,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/elastic_gloves.png")},
                             {name: 'Rubber gloves',   category_id: Equipment::Category.find_by(slug: 'gloves').id, attack: 4,  defense: 11, hp: 20,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/rubber_gloves.png")},
                             {name: 'Gloves of Rogue', category_id: Equipment::Category.find_by(slug: 'gloves').id, attack: 6,  defense: 16, hp: 24,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/gloves_of_rogue.png")},
                             {name: 'Spiked gloves',   category_id: Equipment::Category.find_by(slug: 'gloves').id, attack: 8,  defense: 20, hp: 29,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/spiked_gloves.png")},
                             {name: 'Steel gloves',    category_id: Equipment::Category.find_by(slug: 'gloves').id, attack: 12, defense: 27, hp: 35,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/steel_gloves.png")},
                             {name: 'Emerald gloves',  category_id: Equipment::Category.find_by(slug: 'gloves').id, attack: 14, defense: 30, hp: 44,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/emerald_gloves.png")},
                             {name: 'Titan gloves',    category_id: Equipment::Category.find_by(slug: 'gloves').id, attack: 16, defense: 34, hp: 51,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/titan_gloves.png")},
                             {name: 'Executor gloves', category_id: Equipment::Category.find_by(slug: 'gloves').id, attack: 18, defense: 39, hp: 55,  required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/executor_gloves.png")},
                             {name: 'Hedgehog gloves', category_id: Equipment::Category.find_by(slug: 'gloves').id, attack: 20, defense: 45, hp: 60, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/hedgehog_gloves.png")}]
    ### BRACERS
    Equipment::Item.create! [{name: 'Leather bracers',     category_id: Equipment::Category.find_by(slug: 'bracers').id, attack: 0,  defense: 5,  hp: 10, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/leather_bracers.png")},
                             {name: 'Straw bracers',       category_id: Equipment::Category.find_by(slug: 'bracers').id, attack: 1,  defense: 5,  hp: 15, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/straw_bracers.png")},
                             {name: 'Light bracers',       category_id: Equipment::Category.find_by(slug: 'bracers').id, attack: 2,  defense: 11, hp: 20, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/light_bracers.png")},
                             {name: 'Elefant bracers',     category_id: Equipment::Category.find_by(slug: 'bracers').id, attack: 3,  defense: 16, hp: 24, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/elefant_bracers.png")},
                             {name: 'Emerald bracers',     category_id: Equipment::Category.find_by(slug: 'bracers').id, attack: 4,  defense: 20, hp: 29, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/emerald_bracers.png")},
                             {name: 'Golden bracers',      category_id: Equipment::Category.find_by(slug: 'bracers').id, attack: 5,  defense: 27, hp: 35, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/golden_bracers.png")},
                             {name: 'Spiked bracers',      category_id: Equipment::Category.find_by(slug: 'bracers').id, attack: 6,  defense: 30, hp: 44, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/spiked_bracers.png")},
                             {name: 'Holy bracers',        category_id: Equipment::Category.find_by(slug: 'bracers').id, attack: 7,  defense: 34, hp: 51, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/holy_bracers.png")},
                             {name: 'Titan bracers',       category_id: Equipment::Category.find_by(slug: 'bracers').id, attack: 8,  defense: 39, hp: 55, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/titan_bracers.png")},
                             {name: 'Unbreakable bracers', category_id: Equipment::Category.find_by(slug: 'bracers').id, attack: 10, defense: 45, hp: 61, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/unbreakable_bracers.png")}]
    ### FOOTS
    Equipment::Item.create! [{name: 'Leather boots',      category_id: Equipment::Category.find_by(slug: 'foots').id, attack: 0,  defense: 5,  hp: 10, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/leather_boots.png")},
                             {name: 'Straw shoes',        category_id: Equipment::Category.find_by(slug: 'foots').id, attack: 3,  defense: 5,  hp: 15, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/straw_shoes.png")},
                             {name: 'Magic boots',        category_id: Equipment::Category.find_by(slug: 'foots').id, attack: 6,  defense: 11, hp: 20, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/magic_boots.png")},
                             {name: 'Boots of Manticore', category_id: Equipment::Category.find_by(slug: 'foots').id, attack: 9,  defense: 16, hp: 24, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/boots_of_manticore.png")},
                             {name: 'Ancient boots',      category_id: Equipment::Category.find_by(slug: 'foots').id, attack: 12, defense: 20, hp: 29, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/ancient_boots.png")},
                             {name: 'Boots of Executor',  category_id: Equipment::Category.find_by(slug: 'foots').id, attack: 15, defense: 27, hp: 35, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/boots_of_executor.png")},
                             {name: 'Spiked boots',       category_id: Equipment::Category.find_by(slug: 'foots').id, attack: 18, defense: 30, hp: 44, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/spiked_boots.png")},
                             {name: 'Holy boots',         category_id: Equipment::Category.find_by(slug: 'foots').id, attack: 21, defense: 34, hp: 51, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/holy_boots.png")},
                             {name: 'Titan boots',        category_id: Equipment::Category.find_by(slug: 'foots').id, attack: 24, defense: 39, hp: 55, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/titan_boots.png")},
                             {name: 'Kvark boots',        category_id: Equipment::Category.find_by(slug: 'foots').id, attack: 26, defense: 45, hp: 63, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/kvark_boots.png")}]
    ### BELT
    Equipment::Item.create! [{name: 'Rag belt',          category_id: Equipment::Category.find_by(slug: 'belt').id, attack: 0, defense: 5,  hp: 10,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/rag_belt.png")},
                             {name: 'Warm belt',         category_id: Equipment::Category.find_by(slug: 'belt').id, attack: 0, defense: 5,  hp: 15,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/warm_belt.png")},
                             {name: 'Motley belt',       category_id: Equipment::Category.find_by(slug: 'belt').id, attack: 0, defense: 11, hp: 20,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/motley_belt.png")},
                             {name: 'Spiked belt',       category_id: Equipment::Category.find_by(slug: 'belt').id, attack: 0, defense: 16, hp: 24,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/spiked_belt.png")},
                             {name: 'Ancient belt',      category_id: Equipment::Category.find_by(slug: 'belt').id, attack: 0, defense: 20, hp: 29,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/ancient_belt.png")},
                             {name: 'Belt of Executor',  category_id: Equipment::Category.find_by(slug: 'belt').id, attack: 0, defense: 27, hp: 35,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/belt_of_executor.png")},
                             {name: 'Spiked belt',       category_id: Equipment::Category.find_by(slug: 'belt').id, attack: 0, defense: 30, hp: 44,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/spiked_belt.png")},
                             {name: 'Holy belt',         category_id: Equipment::Category.find_by(slug: 'belt').id, attack: 0, defense: 34, hp: 51,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/holy_belt.png")},
                             {name: 'Titan belt',        category_id: Equipment::Category.find_by(slug: 'belt').id, attack: 0, defense: 39, hp: 55,  required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/titan_belt.png")},
                             {name: 'Kvark belt',        category_id: Equipment::Category.find_by(slug: 'belt').id, attack: 0, defense: 45, hp: 63, required_level: 10, price: 500,  image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/kvark_belt.png")}]
    ### WEAPON
    Equipment::Item.create! [{name: 'Metal axe',       category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 11,  defense: 0, hp: 0, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/metal_axe.png")},
                             {name: 'Light axe',       category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 21,  defense: 0, hp: 0, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/light_axe.png")},
                             {name: 'Rapid axe',       category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 31,  defense: 0, hp: 0, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/rapid_axe.png")},
                             {name: 'Rough axe',       category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 41,  defense: 0, hp: 0, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/rough_axe.png")},
                             {name: 'Round axe',       category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 51,  defense: 0, hp: 0, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/round_axe.png")},
                             {name: 'Kvark axe',       category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 61,  defense: 0, hp: 0, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/kvark_axe.png")},
                             {name: 'Spiked axe',      category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 71,  defense: 0, hp: 0, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/spiked_axe.png")},
                             {name: 'Great axe',       category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 81,  defense: 0, hp: 0, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/great_axe.png")},
                             {name: 'Duke axe',        category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 91,  defense: 0, hp: 0, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/duke_axe.png")},
                             {name: 'Destructive axe', category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 101, defense: 0, hp: 0, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/destructive_axe.png")}]
    ### SHIELD
    Equipment::Item.create! [{name: 'Wood shield',        category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 20,  hp: 15, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/wood_shield.png")},
                             {name: 'Blueberry shield',   category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 30,  hp: 20, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/blueberry_shield.png")},
                             {name: 'Spartan shield',     category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 40,  hp: 24, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/spartan_shield.png")},
                             {name: 'Duke shield',        category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 50,  hp: 29, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/duke_shield.png")},
                             {name: 'Bright shield',      category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 60,  hp: 35, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/bright_shield.png")},
                             {name: 'Spiked shield',      category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 70,  hp: 44, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/spiked_shield.png")},
                             {name: 'Round shield',       category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 80,  hp: 51, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/round_shield.png")},
                             {name: 'Gnoll shield',       category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 90,  hp: 55, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/gnoll_shield.png")},
                             {name: 'Shield of executor', category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 100, hp: 63, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/shield_of_executor.png")},
                             {name: 'Griever shield',     category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 110, hp: 70, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/griever_shield.png")}]
    ### RING
    Equipment::Item.create! [{name: 'Wood ring',    category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 0,  defense: 5,  hp: 10, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/wood_ring.png")},
                             {name: 'Ugly ring',    category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 2,  defense: 8,  hp: 15, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/ugly_ring.png")},
                             {name: 'Lucky ring',   category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 4,  defense: 11, hp: 20, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/lucky_ring.png")},
                             {name: 'Sphere ring',  category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 6,  defense: 16, hp: 24, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/sphere_ring.png")},
                             {name: 'Magic ring',   category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 8,  defense: 20, hp: 29, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/magic_ring.png")},
                             {name: 'Ancient ring', category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 10, defense: 27, hp: 35, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/ancient_ring.png")},
                             {name: 'Elf ring',     category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 12, defense: 30, hp: 44, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/elf_ring.png")},
                             {name: 'Holy ring',    category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 14, defense: 34, hp: 51, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/holy_ring.png")},
                             {name: 'Titan ring',   category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 16, defense: 39, hp: 55, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/titan_ring.png")},
                             {name: 'Kvark ring',   category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 18, defense: 45, hp: 63, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/kvark_ring.png")}]
    ### NECKLACE
    Equipment::Item.create! [{name: 'Bone amulet',      category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0, defense: 5,  hp: 10, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/bone_amulet.png")},
                             {name: 'Stone amulet',     category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0, defense: 6,  hp: 15, required_level: 2,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/stone_amulet.png")},
                             {name: 'Emerald amulet',   category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0, defense: 11, hp: 20, required_level: 3,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/emerald_amulet.png")},
                             {name: 'Satanic amulet',   category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0, defense: 16, hp: 24, required_level: 4,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/satanic_amulet.png")},
                             {name: 'Ancient necklace', category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0, defense: 20, hp: 29, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/ancient_amulet.png")},
                             {name: 'Sunny amulet',     category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0, defense: 27, hp: 35, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/sunny_amulet.png")},
                             {name: 'Spiked amulet',    category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0, defense: 30, hp: 44, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/spiked_amulet.png")},
                             {name: 'Weird amulet',     category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0, defense: 34, hp: 51, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/weird_amulet.png")},
                             {name: 'Round amulet',     category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0, defense: 39, hp: 55, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/round_amulet.png")},
                             {name: 'Draenei amulet',   category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0, defense: 45, hp: 57, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/draenei_amulet.png")}]
    ### CLOAK
    Equipment::Item.create! [{name: 'Tramp cloak',     category_id: Equipment::Category.find_by(slug: 'cloak').id, attack: 0,  defense: 5,  hp: 10,  required_level: 1,  price: 50,    image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/tramp_cloak.png")},
                             {name: 'Gilded cloak',    category_id: Equipment::Category.find_by(slug: 'cloak').id, attack: 0,  defense: 10, hp: 20,  required_level: 5,  price: 500,   image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/gilded_cloak.png")},
                             {name: 'Dementor cloak',  category_id: Equipment::Category.find_by(slug: 'cloak').id, attack: 0,  defense: 20, hp: 40,  required_level: 10, price: 2500,  image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/dementor_cloak.png")},
                             {name: 'Snake cloak',     category_id: Equipment::Category.find_by(slug: 'cloak').id, attack: 0,  defense: 40, hp: 50,  required_level: 15, price: 5000,  image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/snake_cloak.png")}]
    ### PANTS
    Equipment::Item.create! [{name: 'Leather pants',    category_id: Equipment::Category.find_by(slug: 'pants').id, attack: 0,  defense: 5,  hp: 5,    required_level: 1,  price: 50,   image: File.new("#{Rails.root}/db/seeds/equipment/items/pants/leather_pants.png")},
                             {name: 'Warm pants',       category_id: Equipment::Category.find_by(slug: 'pants').id, attack: 0,  defense: 50, hp: 50,   required_level: 5,  price: 500,  image: File.new("#{Rails.root}/db/seeds/equipment/items/pants/warm_pants.png")},
                             {name: 'Spectral pants',   category_id: Equipment::Category.find_by(slug: 'pants').id, attack: 0,  defense: 100, hp: 55,  required_level: 10, price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/pants/spectral_pants.png")},
                             {name: 'Pants of warrior', category_id: Equipment::Category.find_by(slug: 'pants').id, attack: 0,  defense: 200, hp: 200, required_level: 20, price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/pants/pants_of_warrior.png")}]

    ### CROATON
    Equipment::Item.create!(name: 'Cape of Croaton',   category_id: Equipment::Category.find_by(slug: 'cloak').id,  attack: 0,   defense: 66, hp: 666, required_level: 1, price: 50000000, image: File.new("#{Rails.root}/db/seeds/equipment/items/croaton/cape_of_croaton.png"), artifact: true)
    Equipment::Item.create!(name: 'Judgment Day',      category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 666, defense: 66, hp: 666, required_level: 1, price: 50000000, image: File.new("#{Rails.root}/db/seeds/equipment/items/croaton/judgment_day.png"), artifact: true)
    Equipment::Item.create!(name: 'Death Note',        category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 666, defense: 66, hp: 666, required_level: 1, price: 50000000, image: File.new("#{Rails.root}/db/seeds/equipment/items/croaton/death_note.png"), artifact: true)
    Equipment::Item.create!(name: 'Amulet of Croaton', category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0,   defense: 66, hp: 666, required_level: 1, price: 50000000, image: File.new("#{Rails.root}/db/seeds/equipment/items/croaton/amulet_of_croaton.png"), artifact: true)

  ## ARTIFACTS
  ### SAPPHIRE SET
    Equipment::Item.create! [{name: 'Sapphire helm',    category_id: Equipment::Category.find_by(slug: 'helmet').id,   attack: 0,   defense: 70,  hp: 80,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/sapphire_helm.png"), artifact: true},
                             {name: 'Sapphire armor',   category_id: Equipment::Category.find_by(slug: 'armor').id,    attack: 0,   defense: 90,  hp: 120, required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/sapphire_armor.png"), artifact: true},
                             {name: 'Sapphire mail',    category_id: Equipment::Category.find_by(slug: 'mail').id,     attack: 0,   defense: 95,  hp: 100, required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/sapphire_mail.png"), artifact: true},
                             {name: 'Sapphire gloves',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 10,  defense: 65,  hp: 75,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/sapphire_gloves.png"), artifact: true},
                             {name: 'Sapphire bracers', category_id: Equipment::Category.find_by(slug: 'bracers').id,  attack: 15,  defense: 65,  hp: 75,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/sapphire_bracers.png"), artifact: true},
                             {name: 'Sapphire boots',   category_id: Equipment::Category.find_by(slug: 'foots').id,    attack: 15,  defense: 65,  hp: 75,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/art/sapphire_boots.png"), artifact: true},
                             {name: 'Sapphire belt',    category_id: Equipment::Category.find_by(slug: 'belt').id,     attack: 0,   defense: 65,  hp: 75,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/sapphire_belt.png"), artifact: true},
                             {name: 'Sapphire staff',   category_id: Equipment::Category.find_by(slug: 'weapon').id,   attack: 150, defense: 0,   hp: 0,   required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/sapphire_staff.png"), artifact: true},
                             {name: 'Sapphire ring',    category_id: Equipment::Category.find_by(slug: 'ring').id,     attack: 10,  defense: 60,  hp: 80,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/sapphire_ring.png"), artifact: true},
                             {name: 'Sapphire amulet',  category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,   defense: 60,  hp: 70,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/sapphire_amulet.png"), artifact: true}]
  ### BERSERKER SET
    Equipment::Item.create! [{name: 'Helm of Berserker',    category_id: Equipment::Category.find_by(slug: 'helmet').id,   attack: 0,   defense: 120, hp: 120, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/helm_of_berserker.png"), artifact: true},
                             {name: 'Armor of Berserker',   category_id: Equipment::Category.find_by(slug: 'armor').id,    attack: 0,   defense: 110, hp: 140, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/armor_of_berserker.png"), artifact: true},
                             {name: 'Mail of Berserker',    category_id: Equipment::Category.find_by(slug: 'mail').id,     attack: 0,   defense: 105, hp: 125, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/mail_of_berserker.png"), artifact: true},
                             {name: 'Gloves of Berserker',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 15,  defense: 85,  hp: 105, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/gloves_of_berserker.png"), artifact: true},
                             {name: 'Bracers of Berserker', category_id: Equipment::Category.find_by(slug: 'bracers').id,  attack: 15,  defense: 85,  hp: 105, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/bracers_of_berserker.png"), artifact: true},
                             {name: 'Boots of Berserker',   category_id: Equipment::Category.find_by(slug: 'foots').id,    attack: 15,  defense: 85,  hp: 105, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/art/boots_of_berserker.png"), artifact: true},
                             {name: 'Belt of Berserker',    category_id: Equipment::Category.find_by(slug: 'belt').id,     attack: 0,   defense: 75,  hp: 85,  required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/belt_of_berserker.png"), artifact: true},
                             {name: 'Axe of Berserker',   category_id: Equipment::Category.find_by(slug: 'weapon').id,     attack: 180, defense: 0,   hp: 0,   required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/axe_of_berserker.png"), artifact: true},
                             {name: 'Ring of Berserker',    category_id: Equipment::Category.find_by(slug: 'ring').id,     attack: 10,  defense: 70,  hp: 95,  required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/ring_of_berserker.png"), artifact: true},
                             {name: 'Amulet of Berserker',  category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,   defense: 70,  hp: 80,  required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amulet_of_berserker.png"), artifact: true}]
  ### MAD KNIGHT SET
    Equipment::Item.create! [{name: 'Helm of Mad Knight',    category_id: Equipment::Category.find_by(slug: 'helmet').id,   attack: 0,   defense: 125, hp: 140, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/helm_of_mad_knight.png"), artifact: true},
                             {name: 'Armor of Mad Knight',   category_id: Equipment::Category.find_by(slug: 'armor').id,    attack: 0,   defense: 110, hp: 165, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/armor_of_mad_knight.png"), artifact: true},
                             {name: 'Mail of Mad Knight',    category_id: Equipment::Category.find_by(slug: 'mail').id,     attack: 0,   defense: 105, hp: 155, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/mail_of_mad_knight.png"), artifact: true},
                             {name: 'Gloves of Mad Knight',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 20,  defense: 95,  hp: 135, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/gloves_of_mad_knight.png"), artifact: true},
                             {name: 'Bracers of Mad Knight', category_id: Equipment::Category.find_by(slug: 'bracers').id,  attack: 20,  defense: 95,  hp: 135, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/bracers_of_mad_knight.png"), artifact: true},
                             {name: 'Boots of Mad Knight',   category_id: Equipment::Category.find_by(slug: 'foots').id,    attack: 20,  defense: 95,  hp: 135, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/art/boots_of_mad_knight.png"), artifact: true},
                             {name: 'Belt of Mad Knight',    category_id: Equipment::Category.find_by(slug: 'belt').id,     attack: 0,   defense: 80,  hp: 100, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/belt_of_mad_knight.png"), artifact: true},
                             {name: 'Axe of Mad Knight',     category_id: Equipment::Category.find_by(slug: 'weapon').id,   attack: 200, defense: 0,   hp: 0,   required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/axe_of_mad_knight.png"), artifact: true},
                             {name: 'Ring of Mad Knight',    category_id: Equipment::Category.find_by(slug: 'ring').id,     attack: 10,  defense: 70,  hp: 105, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/ring_of_mad_knight.png"), artifact: true},
                             {name: 'Amulet of Mad Knight',  category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,   defense: 70,  hp: 95,  required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amulet_of_mad_knight.png"), artifact: true}]
  ### BARBED SET
    Equipment::Item.create! [{name: 'Barbed helm',    category_id: Equipment::Category.find_by(slug: 'helmet').id,   attack: 0,   defense: 125, hp: 165, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/barbed_helm.png"), artifact: true},
                             {name: 'Barbed armor',   category_id: Equipment::Category.find_by(slug: 'armor').id,    attack: 0,   defense: 110, hp: 185, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/barbed_armor.png"), artifact: true},
                             {name: 'Barbed mail',    category_id: Equipment::Category.find_by(slug: 'mail').id,     attack: 0,   defense: 105, hp: 180, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/barbed_mail.png"), artifact: true},
                             {name: 'Barbed gloves',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 25,  defense: 100, hp: 155, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/barbed_gloves.png"), artifact: true},
                             {name: 'Barbed bracers', category_id: Equipment::Category.find_by(slug: 'bracers').id,  attack: 25,  defense: 100, hp: 150, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/barbed_bracers.png"), artifact: true},
                             {name: 'Barbed boots',   category_id: Equipment::Category.find_by(slug: 'foots').id,    attack: 25,  defense: 100, hp: 155, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/art/barbed_boots.png"), artifact: true},
                             {name: 'Barbed belt',    category_id: Equipment::Category.find_by(slug: 'belt').id,     attack: 0,   defense: 95,  hp: 120, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/barbed_belt.png"), artifact: true},
                             {name: 'Barbed axe',     category_id: Equipment::Category.find_by(slug: 'weapon').id,   attack: 230, defense: 0,   hp: 0,   required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/barbed_axe.png"), artifact: true},
                             {name: 'Barbed ring',    category_id: Equipment::Category.find_by(slug: 'ring').id,     attack: 15,  defense: 70,  hp: 125, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/barbed_ring.png"), artifact: true},
                             {name: 'Barbed amulet',  category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,   defense: 70,  hp: 120, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/barbed_amulet.png"), artifact: true}]
  ### MOON SET
    Equipment::Item.create! [{name: 'Moon helm',    category_id: Equipment::Category.find_by(slug: 'helmet').id,   attack: 0,   defense: 130, hp: 185, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/moon_helm.png"), artifact: true},
                             {name: 'Moon armor',   category_id: Equipment::Category.find_by(slug: 'armor').id,    attack: 0,   defense: 120, hp: 200, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/moon_armor.png"), artifact: true},
                             {name: 'Moon mail',    category_id: Equipment::Category.find_by(slug: 'mail').id,     attack: 0,   defense: 105, hp: 200, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/moon_mail.png"), artifact: true},
                             {name: 'Moon gloves',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 25,  defense: 105, hp: 165, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/moon_gloves.png"), artifact: true},
                             {name: 'Moon bracers', category_id: Equipment::Category.find_by(slug: 'bracers').id,  attack: 25,  defense: 105, hp: 165, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/moon_bracers.png"), artifact: true},
                             {name: 'Moon boots',   category_id: Equipment::Category.find_by(slug: 'foots').id,    attack: 25,  defense: 105, hp: 165, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/art/moon_boots.png"), artifact: true},
                             {name: 'Moon belt',    category_id: Equipment::Category.find_by(slug: 'belt').id,     attack: 0,   defense: 100, hp: 140, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/moon_belt.png"), artifact: true},
                             {name: 'Moon sword',   category_id: Equipment::Category.find_by(slug: 'weapon').id,   attack: 250, defense: 0,   hp: 0,   required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/moon_sword.png"), artifact: true},
                             {name: 'Moon ring',    category_id: Equipment::Category.find_by(slug: 'ring').id,     attack: 15,  defense: 75,  hp: 140, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/moon_ring.png"), artifact: true},
                             {name: 'Moon amulet',  category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,   defense: 75,  hp: 135, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/moon_amulet.png"), artifact: true}]
  ### WINGED GOD SET
    Equipment::Item.create! [{name: 'Helm of Winged God',    category_id: Equipment::Category.find_by(slug: 'helmet').id,   attack: 0,   defense: 135, hp: 200, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/helm_of_winged_god.png"), artifact: true},
                             {name: 'Armor of Winged God',   category_id: Equipment::Category.find_by(slug: 'armor').id,    attack: 0,   defense: 125, hp: 220, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/armor_of_winged_god.png"), artifact: true},
                             {name: 'Mail of Winged God',    category_id: Equipment::Category.find_by(slug: 'mail').id,     attack: 0,   defense: 110, hp: 240, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/mail_of_winged_god.png"), artifact: true},
                             {name: 'Gloves of Winged God',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 30,  defense: 110, hp: 180, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/gloves_of_winged_god.png"), artifact: true},
                             {name: 'Bracers of Winged God', category_id: Equipment::Category.find_by(slug: 'bracers').id,  attack: 30,  defense: 110, hp: 180, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/bracers_of_winged_god.png"), artifact: true},
                             {name: 'Boots of Winged God',   category_id: Equipment::Category.find_by(slug: 'foots').id,    attack: 30,  defense: 110, hp: 180, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/art/boots_of_winged_god.png"), artifact: true},
                             {name: 'Belt of Winged God',    category_id: Equipment::Category.find_by(slug: 'belt').id,     attack: 0,   defense: 100, hp: 160, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/belt_of_winged_god.png"), artifact: true},
                             {name: 'Sword of Winged God',   category_id: Equipment::Category.find_by(slug: 'weapon').id,   attack: 270, defense: 0,   hp: 0,   required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/sword_of_winged_god.png"), artifact: true},
                             {name: 'Ring of Winged God',    category_id: Equipment::Category.find_by(slug: 'ring').id,     attack: 15,  defense: 90,  hp: 160, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/ring_of_winged_god.png"), artifact: true},
                             {name: 'Amulet of Winged God',  category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,   defense: 90,  hp: 150, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amulet_of_winged_god.png"), artifact: true}]
  ### AMBER PHOENIX SET
    Equipment::Item.create! [{name: 'Helm of Amber Phoenix',    category_id: Equipment::Category.find_by(slug: 'helmet').id,   attack: 0,   defense: 140, hp: 220, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/helm_of_amber_phoenix.png"), artifact: true},
                             {name: 'Armor of Amber Phoenix',   category_id: Equipment::Category.find_by(slug: 'armor').id,    attack: 0,   defense: 130, hp: 235, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/armor_of_amber_phoenix.png"), artifact: true},
                             {name: 'Mail of Amber Phoenix',    category_id: Equipment::Category.find_by(slug: 'mail').id,     attack: 0,   defense: 115, hp: 255, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/mail_of_amber_phoenix.png"), artifact: true},
                             {name: 'Gloves of Amber Phoenix',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 35,  defense: 115, hp: 195, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/gloves_of_amber_phoenix.png"), artifact: true},
                             {name: 'Bracers of Amber Phoenix', category_id: Equipment::Category.find_by(slug: 'bracers').id,  attack: 35,  defense: 115, hp: 195, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/bracers_of_amber_phoenix.png"), artifact: true},
                             {name: 'Boots of Amber Phoenix',   category_id: Equipment::Category.find_by(slug: 'foots').id,    attack: 35,  defense: 115, hp: 195, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/art/boots_of_amber_phoenix.png"), artifact: true},
                             {name: 'Belt of Amber Phoenix',    category_id: Equipment::Category.find_by(slug: 'belt').id,     attack: 0,   defense: 100, hp: 175, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/belt_of_amber_phoenix.png"), artifact: true},
                             {name: 'Axe of Amber Phoenix',     category_id: Equipment::Category.find_by(slug: 'weapon').id,   attack: 300, defense: 0,   hp: 0,   required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/axe_of_amber_phoenix.png"), artifact: true},
                             {name: 'Ring of Amber Phoenix',    category_id: Equipment::Category.find_by(slug: 'ring').id,     attack: 15,  defense: 100, hp: 180, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/ring_of_amber_phoenix.png"), artifact: true},
                             {name: 'Amulet of Amber Phoenix',  category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,   defense: 100, hp: 170, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amulet_of_amber_phoenix.png"), artifact: true}]
  ### AMETHYST SET
    Equipment::Item.create! [{name: 'Amethyst helm',    category_id: Equipment::Category.find_by(slug: 'helmet').id,   attack: 0,   defense: 140, hp: 240, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/amethyst_helm.png"), artifact: true},
                             {name: 'Amethyst armor',   category_id: Equipment::Category.find_by(slug: 'armor').id,    attack: 0,   defense: 150, hp: 255, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/amethyst_armor.png"), artifact: true},
                             {name: 'Amethyst mail',    category_id: Equipment::Category.find_by(slug: 'mail').id,     attack: 0,   defense: 125, hp: 270, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/amethyst_mail.png"), artifact: true},
                             {name: 'Amethyst gloves',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 40,  defense: 125, hp: 220, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/amethyst_gloves.png"), artifact: true},
                             {name: 'Amethyst bracers', category_id: Equipment::Category.find_by(slug: 'bracers').id,  attack: 40,  defense: 125, hp: 215, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/amethyst_bracers.png"), artifact: true},
                             {name: 'Amethyst boots',   category_id: Equipment::Category.find_by(slug: 'foots').id,    attack: 40,  defense: 125, hp: 215, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/art/amethyst_boots.png"), artifact: true},
                             {name: 'Amethyst belt',    category_id: Equipment::Category.find_by(slug: 'belt').id,     attack: 0,   defense: 100, hp: 190, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/amethyst_belt.png"), artifact: true},
                             {name: 'Amethyst axe',     category_id: Equipment::Category.find_by(slug: 'weapon').id,   attack: 330, defense: 0,   hp: 0,  required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/amethyst_axe.png"), artifact: true},
                             {name: 'Amethyst ring',    category_id: Equipment::Category.find_by(slug: 'ring').id,     attack: 20,  defense: 105, hp: 200, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/amethyst_ring.png"), artifact: true},
                             {name: 'Amethyst amulet',  category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,   defense: 105, hp: 190, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amethyst_amulet.png"), artifact: true}]
  ### DEMON WARRIOR SET
    Equipment::Item.create! [{name: 'Helm of Demon Warrior',    category_id: Equipment::Category.find_by(slug: 'helmet').id,   attack: 0,   defense: 150, hp: 260, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/helm_of_demon_warrior.png"), artifact: true},
                             {name: 'Armor of Demon Warrior',   category_id: Equipment::Category.find_by(slug: 'armor').id,    attack: 0,   defense: 155, hp: 265, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/armor_of_demon_warrior.png"), artifact: true},
                             {name: 'Mail of Demon Warrior',    category_id: Equipment::Category.find_by(slug: 'mail').id,     attack: 0,   defense: 130, hp: 280, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/mail_of_demon_warrior.png"), artifact: true},
                             {name: 'Gloves of Demon Warrior',  category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 45,  defense: 135, hp: 230, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/gloves_of_demon_warrior.png"), artifact: true},
                             {name: 'Bracers of Demon Warrior', category_id: Equipment::Category.find_by(slug: 'bracers').id,  attack: 45,  defense: 130, hp: 225, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/bracers_of_demon_warrior.png"), artifact: true},
                             {name: 'Boots of Demon Warrior',   category_id: Equipment::Category.find_by(slug: 'foots').id,    attack: 45,  defense: 135, hp: 230, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/foots/art/boots_of_demon_warrior.png"), artifact: true},
                             {name: 'Belt of Demon Warrior',    category_id: Equipment::Category.find_by(slug: 'belt').id,     attack: 0,   defense: 105, hp: 200, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/belt_of_demon_warrior.png"), artifact: true},
                             {name: 'Sword of Demon Warrior',   category_id: Equipment::Category.find_by(slug: 'weapon').id,   attack: 360, defense: 0,   hp: 0,   required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/sword_of_demon_warrior.png"), artifact: true},
                             {name: 'Ring of Demon Warrior',    category_id: Equipment::Category.find_by(slug: 'ring').id,     attack: 25,  defense: 110,  hp: 240, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/ring_of_demon_warrior.png"), artifact: true},
                             {name: 'Amulet of Demon Warrior',  category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,   defense: 110,  hp: 210, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amulet_of_demon_warrior.png"), artifact: true}]


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
Bot.create! [{level: 1, name: 'Armillaria',  attack: 15,  defense: 80,  hp: 100, image: File.new("#{Rails.root}/db/seeds/bots/armillaria.jpg")},
             {level: 2, name: 'Chanterelle', attack: 40,  defense: 85,  hp: 150, image: File.new("#{Rails.root}/db/seeds/bots/chanterelle.jpg")},
             {level: 3, name: 'Amanita',     attack: 60,  defense: 120, hp: 200, image: File.new("#{Rails.root}/db/seeds/bots/amanita.jpg")},
             {level: 4, name: 'Rat',         attack: 90,  defense: 180, hp: 250, image: File.new("#{Rails.root}/db/seeds/bots/rat.jpg")},
             {level: 5, name: 'Spider',      attack: 110, defense: 300, hp: 400, image: File.new("#{Rails.root}/db/seeds/bots/spider.jpg")},
             {level: 6, name: 'Hoblin',      attack: 160, defense: 300, hp: 600, image: File.new("#{Rails.root}/db/seeds/bots/hoblin.jpg")},
             {level: 7, name: 'Ork',         attack: 200, defense: 350, hp: 800, image: File.new("#{Rails.root}/db/seeds/bots/ork.jpg")},
             {level: 8, name: 'Drowned',     attack: 220,  defense: 80, hp: 1000, image: File.new("#{Rails.root}/db/seeds/bots/drowned.jpg")}]

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
