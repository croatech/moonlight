User.create(email: 'admin@gmail.com', password: 'password')

Location.create(name: 'Moon Light', slug: 'moon_light')
Location.create(name: 'The Elder Shop', slug: 'the_elder_shop', parent_id: Location.find_by(slug: 'moon_light').id)
Location.create(name: 'Mushroom\'s room', slug: 'mushrooms', parent_id: Location.find_by(slug: 'moon_light').id)

Item::Category.create(name: 'Head', slug: 'head')
Item::Category.create(name: 'Chest', slug: 'chest')
Item::Category.create(name: 'Shoulders', slug: 'shoulders')
Item::Category.create(name: 'Hands', slug: 'hands')
Item::Category.create(name: 'Legs', slug: 'legs')
Item::Category.create(name: 'Weapon', slug: 'weapon')
Item::Category.create(name: 'Shield', slug: 'shield')

Item::Item.create(name: 'Gold sword', category_id: Item::Category.find_by(slug: 'weapon').id, attack: 5, defense: 2, hp: 20, level: 1, cost: 50,
                  image: File.new("#{Rails.root}/public/items/weapon/sword.jpg"))
Item::Item.create(name: 'Wind staff', category_id: Item::Category.find_by(slug: 'weapon').id, attack: 20, defense: 5, hp: 50, level: 3, cost: 150,
                  image: File.new("#{Rails.root}/public/items/weapon/wind_staff.jpg"))
Item::Item.create(name: 'Gold helm', category_id: Item::Category.find_by(slug: 'head').id, attack: 0, defense: 10, hp: 30, level: 1, cost: 50,
                  image: File.new("#{Rails.root}/public/items/head/helm.jpg"))
Item::Item.create(name: 'Gold shield', category_id: Item::Category.find_by(slug: 'shield').id, attack: 0, defense: 20, hp: 30, level: 1, cost: 50,
                  image: File.new("#{Rails.root}/public/items/shield/shield.jpg"))
Item::Item.create(name: 'Metal chest', category_id: Item::Category.find_by(slug: 'chest').id, attack: 0, defense: 50, hp: 50, level: 1, cost: 50,
                  image: File.new("#{Rails.root}/public/items/chest/chest.jpg"))
Item::Item.create(name: 'Metal shoes', category_id: Item::Category.find_by(slug: 'legs').id, attack: 10, defense: 10, hp: 10, level: 1, cost: 50,
                  image: File.new("#{Rails.root}/public/items/legs/legs.jpg"))

Bot::Mushroom.create(name: 'Armillaria', attack: 20, defense: 20, hp: 20,
                     image: File.new("#{Rails.root}/public/bots/mushrooms/armillaria.jpg"))
Bot::Mushroom.create(name: 'Chanterelle', attack: 40, defense: 40, hp: 40,
                     image: File.new("#{Rails.root}/public/bots/mushrooms/chanterelle.jpg"))