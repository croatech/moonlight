# USERS #
User.create!(email: 'admin@gmail.com', password: 'password')

# LOCATIONS #
Location.create!(name: 'Moon Light', slug: 'moon_light')
Location.create! [{name: 'Weapon Shop', slug: 'weapon_shop', parent_id: Location.find_by(slug: 'moon_light').id},
                 {name: 'Craft Shop', slug: 'craft_shop', parent_id: Location.find_by(slug: 'moon_light').id},
                 {name: 'Wayward Pines', slug: 'wayward_pines'}]

64.times do |t|
  location_name = "#{t} cell"
  location_name = 'Mycelium' if t + 1 == 22
  Location.create!(name: "#{location_name}", slug: "#{t+1}", parent_id: Location.find_by(slug: 'wayward_pines').id, cell: true)
end

# EQUIPMENTS
## CATEGORIES
Equipment::Category.create! [{name: 'Head', slug: 'head'},
                            {name: 'Chest', slug: 'chest'},
                            {name: 'Shoulders', slug: 'shoulders'},
                            {name: 'Hands', slug: 'hands'},
                            {name: 'Legs', slug: 'legs'},
                            {name: 'Weapon', slug: 'weapon'},
                            {name: 'Shield', slug: 'shield'}]

## ITEMS
Equipment::Item.create! [{name: 'Gold sword', category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 5, defense: 2, hp: 20, level: 1, price: 50,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/weapon/sword.jpg")},
                        {name: 'Wind staff', category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 20, defense: 5, hp: 50, level: 3, price: 150,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/weapon/wind_staff.jpg")},
                        {name: 'Gold helm', category_id: Equipment::Category.find_by(slug: 'head').id, attack: 0, defense: 10, hp: 30, level: 1, price: 50,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/head/helm.jpg")},
                        {name: 'Gold shield', category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 20, hp: 30, level: 1, price: 50,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/shield/shield.jpg")},
                        {name: 'Metal chest', category_id: Equipment::Category.find_by(slug: 'chest').id, attack: 0, defense: 50, hp: 50, level: 1, price: 50,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/chest/chest.jpg")},
                        {name: 'Metal shoes', category_id: Equipment::Category.find_by(slug: 'legs').id, attack: 10, defense: 10, hp: 10, level: 1, price: 50,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/legs/legs.jpg")}]

# TOOLS
## CATEGORIES
Tool::Category.create! [{name: 'Chopping Axes', slug: 'axes'},
                       {name: 'Fishing Rods', slug: 'rods'}]

## ITEMS
Tool::Item.create! [{name: 'Axe for a beginner', category_id: Tool::Category.find_by(slug: 'axes').id, price: 50, required_skill: 0, type: 'lumberjacking',
                    image: File.new("#{Rails.root}/db/seeds/tools/items/axe_for_a_beginner.png")},
                   {name: 'Axe for a student', category_id: Tool::Category.find_by(slug: 'axes').id, price: 100, required_skill: 50, type: 'lumberjacking',
                    image: File.new("#{Rails.root}/db/seeds/tools/items/axe_for_a_student.png")}]

# BOTS
Bot::Mushroom.create! [{level: 1, name: 'Armillaria', attack: 10, defense: 10, hp: 10, image: File.new("#{Rails.root}/db/seeds/bots/mushrooms/armillaria.jpg")},
                      {level: 2, name: 'Chanterelle', attack: 20, defense: 20, hp: 20, image: File.new("#{Rails.root}/db/seeds/bots/mushrooms/chanterelle.jpg")},
                      {level: 3, name: 'Amanita', attack: 30, defense: 30, hp: 30, image: File.new("#{Rails.root}/db/seeds/bots/mushrooms/amanita.jpg")}]

# POPULATE BOTS
## MUSHROOMS
locations = Location.all
mycelium = locations.find_by(slug: 22)

Bot::Mushroom.all.each do |bot|
  LocationBot.create!(location_id: mycelium.id, bot_id: bot.id)
end