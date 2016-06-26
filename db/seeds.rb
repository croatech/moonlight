# USERS #
User.create!(email: 'admin@gmail.com', password: 'password')
Player.first.increment!(:gold, 5555)
# LOCATIONS #
Location.create!(name: 'Moon Light',      slug: 'moon_light')
Location.create! [{name: 'Weapon Shop',   slug: 'weapon_shop', parent_id: Location.find_by(slug: 'moon_light').id},
                  {name: 'Craft Shop',    slug: 'craft_shop',  parent_id: Location.find_by(slug: 'moon_light').id},
                  {name: 'Wayward Pines', slug: 'wayward_pines'}]

64.times do |t|
  location_name = "#{t} cell"

  case t + 1 
  when 22
    location_name = 'Mycelium'
  when 28
    location_name = 'Dalf Lagoon'
  when 29, 36
    location_name = 'Sacred Forest'
  when 37
    location_name = 'Shady walk'
  end

  Location.create!(name: "#{location_name}", slug: "#{t+1}", parent_id: Location.find_by(slug: 'wayward_pines').id, cell: true)
end

# EQUIPMENTS
## CATEGORIES
Equipment::Category.create! [{name: 'Helmet',   slug: 'helmet'},
                             {name: 'Armor',    slug: 'armor'},
                             {name: 'Mail',     slug: 'mail'},
                             {name: 'Gloves',   slug: 'gloves'},
                             {name: 'Bracers',  slug: 'bracers'},
                             {name: 'Foots',    slug: 'foots'},
                             {name: 'Belt',    slug: 'belt'},
                             {name: 'Weapon',   slug: 'weapon'},
                             {name: 'Shield',   slug: 'shield'},
                             {name: 'Ring',     slug: 'ring'},
                             {name: 'Necklace', slug: 'necklace'}]

## ITEMS
### HELMET
Equipment::Item.create! [{name: 'Leather hat',      category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 10, hp: 10,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipments/items/helmet/leather_hat.png")},
                         {name: 'Bone helm',        category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 10, hp: 20,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipments/items/helmet/bone_helm.png")},
                         {name: 'Scary mask',       category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 15, hp: 30,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipments/items/helmet/scary_mask.png")},
                         {name: 'Bloody helm',      category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 20, hp: 40,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipments/items/helmet/bloody_helm.png")},
                         {name: 'Gold helm',        category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 25, hp: 50,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipments/items/helmet/gold_helm.png")},
                         {name: 'Wiking helm',      category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 30, hp: 60,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipments/items/helmet/wiking_helm.png")},
                         {name: 'Mithrill helm',    category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 35, hp: 70,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipments/items/helmet/mithrill_helm.png")},
                         {name: 'Shell helm',       category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 40, hp: 80,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipments/items/helmet/shell_helm.png")},
                         {name: 'Holy helm',        category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 45, hp: 90,  required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipments/items/helmet/holy_helm.png")},
                         {name: 'Streamlined helm', category_id: Equipment::Category.find_by(slug: 'helmet').id, attack: 0, defense: 50, hp: 100, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipments/items/helmet/streamlined_helm.png")}]
### CHEST
Equipment::Item.create! [{name: 'Leather armor',   category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 10, hp: 20,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipments/items/armor/leather_armor.png")},
                         {name: 'Bright armor',    category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 15, hp: 30,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipments/items/armor/bright_armor.png")},
                         {name: 'Scary armor',     category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 20, hp: 40,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipments/items/armor/scary_armor.png")},
                         {name: 'Kvark armor',     category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 25, hp: 50,  required_level: 4,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipments/items/armor/kvark_armor.png")},
                         {name: 'Gold armor',      category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 30, hp: 60,  required_level: 5,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipments/items/armor/gold_armor.png")},
                         {name: 'Centuri armor',   category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 35, hp: 70,  required_level: 6,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipments/items/armor/centuri_armor.png")},
                         {name: 'Sea armor',       category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 40, hp: 80,  required_level: 7,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipments/items/armor/sea_armor.png")},
                         {name: 'Blueberry armor', category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 45, hp: 90,  required_level: 8,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipments/items/armor/blueberry_armor.png")},
                         {name: 'Holy armor',      category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 50, hp: 100, required_level: 9,  price: 500, image: File.new("#{Rails.root}/db/seeds/equipments/items/armor/holy_armor.png")},
                         {name: 'Elite armor',     category_id: Equipment::Category.find_by(slug: 'armor').id, attack: 0, defense: 55, hp: 110, required_level: 10, price: 550, image: File.new("#{Rails.root}/db/seeds/equipments/items/armor/elite_armor.png")}]

### MAIL
Equipment::Item.create! [{name: 'Fur Vest',       category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 10, hp: 20,  required_level: 1,  price: 50, image: File.new("#{Rails.root}/db/seeds/equipments/items/mail/fur_vest.png")},
                         {name: 'Slinky mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 15, hp: 30,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipments/items/mail/slinky_mail.png")},
                         {name: 'Binded mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 20, hp: 40,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipments/items/mail/binded_mail.png")},
                         {name: 'Assasin jacket', category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 25, hp: 50,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipments/items/mail/assasin_jacket.png")},
                         {name: 'Metal mail',     category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 30, hp: 60,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipments/items/mail/metal_mail.png")},
                         {name: 'Steel mail',     category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 35, hp: 70,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipments/items/mail/steel_mail.png")},
                         {name: 'Copper mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 40, hp: 80,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipments/items/mail/copper_mail.png")},
                         {name: 'Sacred mail',    category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 45, hp: 90,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipments/items/mail/sacred_mail.png")},
                         {name: 'Kvark mail',     category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 50, hp: 100, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipments/items/mail/kvark_mail.png")},
                         {name: 'Earl mail',      category_id: Equipment::Category.find_by(slug: 'mail').id, attack: 0, defense: 55, hp: 110, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipments/items/mail/earl_mail.png")}]
### GLOVES
Equipment::Item.create! [{name: 'Leather Gloves',category_id: Equipment::Category.find_by(slug: 'gloves').id,   attack: 0, defense: 10, hp: 20, required_level: 1, price: 50, image: File.new("#{Rails.root}/db/seeds/equipments/items/gloves/leather_gloves.png")}]
### BRACERS
Equipment::Item.create! [{name: 'Leather Bracers',category_id: Equipment::Category.find_by(slug: 'bracers').id,   attack: 0, defense: 5, hp: 10, required_level: 1, price: 50, image: File.new("#{Rails.root}/db/seeds/equipments/items/bracers/leather_bracers.png")}]
### PANTS
Equipment::Item.create! [{name: 'Leather shoes', category_id: Equipment::Category.find_by(slug: 'foots').id,   attack: 5, defense: 5, hp: 10, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipments/items/foots/leather_shoes.png")}]
### BELT
Equipment::Item.create! [{name: 'Rag belt', category_id: Equipment::Category.find_by(slug: 'belt').id,   attack: 0, defense: 5, hp: 10, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipments/items/belt/rag_belt.png")}]
### WEAPON
Equipment::Item.create! [{name: 'Metal axe',     category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 10,  defense: 0,  hp: 0, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipments/items/weapon/metal_axe.png")}]
### SHIELD
Equipment::Item.create! [{name: 'Wood shield',   category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0,  defense: 20, hp: 30, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipments/items/shield/wood_shield.png")}]
### RING
Equipment::Item.create! [{name: 'Wood ring',   category_id: Equipment::Category.find_by(slug: 'ring').id, attack: 5,  defense: 5, hp: 5, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipments/items/ring/wood_ring.png")}]
### NECKLACE
Equipment::Item.create! [{name: 'Bone necklace',   category_id: Equipment::Category.find_by(slug: 'necklace').id, attack: 0,  defense: 5, hp: 5, required_level: 1, price: 50,  image: File.new("#{Rails.root}/db/seeds/equipments/items/necklace/bone_necklace.png")}]


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
                  {name: 'Mysterious_wood', item_id: Tool::Item.find_by(name: 'Axe for a mysterious wood').id, price: 80, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/mysterious_wood.png")}]

# POPULATE RESOURCES
## LUMBERJACKING
### MULTIPLE CELLS
Location.where(name: 'Sacred Forest').each do |location|
  LocationResource.create! [{location_id: location.id, resource_id: Resource.find_by(name: 'Beech').id},
                            {location_id: location.id, resource_id: Resource.find_by(name: 'Elm').id}]
end

### SINGLE CELLS
LocationResource.create!(location_id: Location.find_by(name: 'Dalf Lagoon').id, resource_id: Resource.find_by(name: 'Larch').id)

# BOTS
Bot.create! [{level: 1, name: 'Armillaria',  attack: 10, defense: 10, hp: 100,  image: File.new("#{Rails.root}/db/seeds/bots/armillaria.jpg")},
             {level: 2, name: 'Chanterelle', attack: 20, defense: 20, hp: 200,  image: File.new("#{Rails.root}/db/seeds/bots/chanterelle.jpg")},
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
                     {location_id: Location.find_by(name: 'Shady walk').id,  bot_id: Bot.find_by(name: 'Rat').id},
                     {location_id: Location.find_by(name: 'Shady walk').id,  bot_id: Bot.find_by(name: 'Spider').id},
                     {location_id: Location.find_by(name: 'Dalf Lagoon').id, bot_id: Bot.find_by(name: 'Drowned').id}]
