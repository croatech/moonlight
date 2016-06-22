# USERS #
User.create(email: 'admin@gmail.com', password: 'password')

# LOCATIONS #
Location.create(name: 'Moon Light', slug: 'moon_light')
Location.create(name: 'The Elder Shop', slug: 'the_elder_shop', parent_id: Location.find_by(slug: 'moon_light').id)
Location.create(name: 'Mushroom\'s room', slug: 'mushrooms', parent_id: Location.find_by(slug: 'moon_light').id)
Location.create(name: 'Wayward Pines', slug: 'wayward_pines')

64.times do |t|
  location_name = "#{t} cell"
  location_name = 'Mycelium' if t + 1 == 22
  Location.create(name: "#{location_name}", slug: "#{t+1}", parent_id: Location.find_by(slug: 'wayward_pines').id, cell: true)
end

# EQUIPMENT
## CATEGORY
Equipment::Category.create(name: 'Head', slug: 'head')
Equipment::Category.create(name: 'Chest', slug: 'chest')
Equipment::Category.create(name: 'Shoulders', slug: 'shoulders')
Equipment::Category.create(name: 'Hands', slug: 'hands')
Equipment::Category.create(name: 'Legs', slug: 'legs')
Equipment::Category.create(name: 'Weapon', slug: 'weapon')
Equipment::Category.create(name: 'Shield', slug: 'shield')

## ITEM
Equipment::Item.create(name: 'Gold sword', category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 5, defense: 2, hp: 20, level: 1, cost: 50,
                  image: File.new("#{Rails.root}/public/items/weapon/sword.jpg"))
Equipment::Item.create(name: 'Wind staff', category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 20, defense: 5, hp: 50, level: 3, cost: 150,
                  image: File.new("#{Rails.root}/public/items/weapon/wind_staff.jpg"))
Equipment::Item.create(name: 'Gold helm', category_id: Equipment::Category.find_by(slug: 'head').id, attack: 0, defense: 10, hp: 30, level: 1, cost: 50,
                  image: File.new("#{Rails.root}/public/items/head/helm.jpg"))
Equipment::Item.create(name: 'Gold shield', category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 20, hp: 30, level: 1, cost: 50,
                  image: File.new("#{Rails.root}/public/items/shield/shield.jpg"))
Equipment::Item.create(name: 'Metal chest', category_id: Equipment::Category.find_by(slug: 'chest').id, attack: 0, defense: 50, hp: 50, level: 1, cost: 50,
                  image: File.new("#{Rails.root}/public/items/chest/chest.jpg"))
Equipment::Item.create(name: 'Metal shoes', category_id: Equipment::Category.find_by(slug: 'legs').id, attack: 10, defense: 10, hp: 10, level: 1, cost: 50,
                  image: File.new("#{Rails.root}/public/items/legs/legs.jpg"))

# BOT
Bot::Mushroom.create(level: 1, name: 'Armillaria', attack: 10, defense: 10, hp: 10,
                     image: File.new("#{Rails.root}/public/bots/mushrooms/armillaria.jpg"))
Bot::Mushroom.create(level: 2, name: 'Chanterelle', attack: 20, defense: 20, hp: 20,
                     image: File.new("#{Rails.root}/public/bots/mushrooms/chanterelle.jpg"))
Bot::Mushroom.create(level: 3, name: 'Amanita', attack: 30, defense: 30, hp: 30,
                     image: File.new("#{Rails.root}/public/bots/mushrooms/amanita.jpg"))

# POPULATE BOTS
## MUSHROOMS
locations = Location.all
mycelium = locations.find_by(slug: 22)

Bot::Mushroom.all.each do |bot|
  LocationBot.create(location_id: mycelium.id, bot_id: bot.id)
end