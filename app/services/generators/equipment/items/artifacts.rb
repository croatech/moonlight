module Generators::Equipment::Items::Artifacts
  class << self
    def call
      seed_sapphire_set
      seed_berserker_set
      seed_mad_knight_set
      seed_barbed_set
      seed_moon_set
      seed_winged_god_set
      seed_amber_phoenix_set
      seed_emthyst_set
      seed_demon_warrior_set
    end

    def seed_sapphire_set
      Equipment::Item.create!(
        [
          { name: 'Sapphire helm',    equipment_category_id: Equipment::Category.find_by(type: 'helmet').id,   attack: 0,   defense: 70,  hp: 80,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/sapphire_helm.png"), artifact: true },
          { name: 'Sapphire armor',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id,    attack: 0,   defense: 90,  hp: 120, required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/sapphire_armor.png"), artifact: true },
          { name: 'Sapphire mail',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id,     attack: 0,   defense: 95,  hp: 100, required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/sapphire_mail.png"), artifact: true },
          { name: 'Sapphire gloves',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id,   attack: 10,  defense: 65,  hp: 75,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/sapphire_gloves.png"), artifact: true },
          { name: 'Sapphire bracers', equipment_category_id: Equipment::Category.find_by(type: 'bracers').id,  attack: 15,  defense: 65,  hp: 75,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/sapphire_bracers.png"), artifact: true },
          { name: 'Sapphire boots',   equipment_category_id: Equipment::Category.find_by(type: 'shoes').id,    attack: 15,  defense: 65,  hp: 75,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/art/sapphire_boots.png"), artifact: true },
          { name: 'Sapphire belt',    equipment_category_id: Equipment::Category.find_by(type: 'belt').id,     attack: 0,   defense: 65,  hp: 75,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/sapphire_belt.png"), artifact: true },
          { name: 'Sapphire staff',   equipment_category_id: Equipment::Category.find_by(type: 'weapon').id,   attack: 150, defense: 0,   hp: 0,   required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/sapphire_staff.png"), artifact: true },
          { name: 'Sapphire ring',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id,     attack: 10,  defense: 60,  hp: 80,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/sapphire_ring.png"), artifact: true },
          { name: 'Sapphire amulet',  equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0,   defense: 60,  hp: 70,  required_level: 11,  price: 3000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/sapphire_amulet.png"), artifact: true }
        ]
      )
    end

    def seed_berserker_set
      Equipment::Item.create!(
        [
          { name: 'Helm of Berserker',    equipment_category_id: Equipment::Category.find_by(type: 'helmet').id,   attack: 0,   defense: 120, hp: 120, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/helm_of_berserker.png"), artifact: true },
          { name: 'Armor of Berserker',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id,    attack: 0,   defense: 110, hp: 140, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/armor_of_berserker.png"), artifact: true },
          { name: 'Mail of Berserker',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id,     attack: 0,   defense: 105, hp: 125, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/mail_of_berserker.png"), artifact: true },
          { name: 'Gloves of Berserker',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id,   attack: 15,  defense: 85,  hp: 105, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/gloves_of_berserker.png"), artifact: true },
          { name: 'Bracers of Berserker', equipment_category_id: Equipment::Category.find_by(type: 'bracers').id,  attack: 15,  defense: 85,  hp: 105, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/bracers_of_berserker.png"), artifact: true },
          { name: 'Boots of Berserker',   equipment_category_id: Equipment::Category.find_by(type: 'shoes').id,    attack: 15,  defense: 85,  hp: 105, required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/art/boots_of_berserker.png"), artifact: true },
          { name: 'Belt of Berserker',    equipment_category_id: Equipment::Category.find_by(type: 'belt').id,     attack: 0,   defense: 75,  hp: 85,  required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/belt_of_berserker.png"), artifact: true },
          { name: 'Axe of Berserker',     equipment_category_id: Equipment::Category.find_by(type: 'weapon').id,   attack: 180, defense: 0,   hp: 0,   required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/axe_of_berserker.png"), artifact: true },
          { name: 'Ring of Berserker',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id,     attack: 10,  defense: 70,  hp: 95,  required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/ring_of_berserker.png"), artifact: true },
          { name: 'Amulet of Berserker',  equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0,   defense: 70,  hp: 80,  required_level: 12,  price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amulet_of_berserker.png"), artifact: true }
        ]
      )
    end

    def seed_mad_knight_set
      Equipment::Item.create!(
        [
          { name: 'Helm of Mad Knight',    equipment_category_id: Equipment::Category.find_by(type: 'helmet').id,   attack: 0,   defense: 125, hp: 140, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/helm_of_mad_knight.png"), artifact: true },
          { name: 'Armor of Mad Knight',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id,    attack: 0,   defense: 110, hp: 165, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/armor_of_mad_knight.png"), artifact: true },
          { name: 'Mail of Mad Knight',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id,     attack: 0,   defense: 105, hp: 155, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/mail_of_mad_knight.png"), artifact: true },
          { name: 'Gloves of Mad Knight',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id,   attack: 20,  defense: 95,  hp: 135, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/gloves_of_mad_knight.png"), artifact: true },
          { name: 'Bracers of Mad Knight', equipment_category_id: Equipment::Category.find_by(type: 'bracers').id,  attack: 20,  defense: 95,  hp: 135, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/bracers_of_mad_knight.png"), artifact: true },
          { name: 'Boots of Mad Knight',   equipment_category_id: Equipment::Category.find_by(type: 'shoes').id,    attack: 20,  defense: 95,  hp: 135, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/art/boots_of_mad_knight.png"), artifact: true },
          { name: 'Belt of Mad Knight',    equipment_category_id: Equipment::Category.find_by(type: 'belt').id,     attack: 0,   defense: 80,  hp: 100, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/belt_of_mad_knight.png"), artifact: true },
          { name: 'Axe of Mad Knight',     equipment_category_id: Equipment::Category.find_by(type: 'weapon').id,   attack: 200, defense: 0,   hp: 0,   required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/axe_of_mad_knight.png"), artifact: true },
          { name: 'Ring of Mad Knight',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id,     attack: 10,  defense: 70,  hp: 105, required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/ring_of_mad_knight.png"), artifact: true },
          { name: 'Amulet of Mad Knight',  equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0,   defense: 70,  hp: 95,  required_level: 13,  price: 8000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amulet_of_mad_knight.png"), artifact: true }
        ]
      )
    end

    def seed_barbed_set
      Equipment::Item.create!(
        [
          { name: 'Barbed helm',    equipment_category_id: Equipment::Category.find_by(type: 'helmet').id,   attack: 0,   defense: 125, hp: 165, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/barbed_helm.png"), artifact: true },
          { name: 'Barbed armor',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id,    attack: 0,   defense: 110, hp: 185, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/barbed_armor.png"), artifact: true },
          { name: 'Barbed mail',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id,     attack: 0,   defense: 105, hp: 180, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/barbed_mail.png"), artifact: true },
          { name: 'Barbed gloves',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id,   attack: 25,  defense: 100, hp: 155, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/barbed_gloves.png"), artifact: true },
          { name: 'Barbed bracers', equipment_category_id: Equipment::Category.find_by(type: 'bracers').id,  attack: 25,  defense: 100, hp: 150, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/barbed_bracers.png"), artifact: true },
          { name: 'Barbed boots',   equipment_category_id: Equipment::Category.find_by(type: 'shoes').id,    attack: 25,  defense: 100, hp: 155, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/art/barbed_boots.png"), artifact: true },
          { name: 'Barbed belt',    equipment_category_id: Equipment::Category.find_by(type: 'belt').id,     attack: 0,   defense: 95,  hp: 120, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/barbed_belt.png"), artifact: true },
          { name: 'Barbed axe',     equipment_category_id: Equipment::Category.find_by(type: 'weapon').id,   attack: 230, defense: 0,   hp: 0,   required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/barbed_axe.png"), artifact: true },
          { name: 'Barbed ring',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id,     attack: 15,  defense: 70,  hp: 125, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/barbed_ring.png"), artifact: true },
          { name: 'Barbed amulet',  equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0,   defense: 70,  hp: 120, required_level: 14,  price: 12000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/barbed_amulet.png"), artifact: true }
        ]
      )
    end

    def seed_moon_set
      Equipment::Item.create!(
        [
          { name: 'Moon helm',    equipment_category_id: Equipment::Category.find_by(type: 'helmet').id,   attack: 0,   defense: 130, hp: 185, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/moon_helm.png"), artifact: true },
          { name: 'Moon armor',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id,    attack: 0,   defense: 120, hp: 200, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/moon_armor.png"), artifact: true },
          { name: 'Moon mail',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id,     attack: 0,   defense: 105, hp: 200, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/moon_mail.png"), artifact: true },
          { name: 'Moon gloves',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id,   attack: 25,  defense: 105, hp: 165, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/moon_gloves.png"), artifact: true },
          { name: 'Moon bracers', equipment_category_id: Equipment::Category.find_by(type: 'bracers').id,  attack: 25,  defense: 105, hp: 165, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/moon_bracers.png"), artifact: true },
          { name: 'Moon boots',   equipment_category_id: Equipment::Category.find_by(type: 'shoes').id,    attack: 25,  defense: 105, hp: 165, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/art/moon_boots.png"), artifact: true },
          { name: 'Moon belt',    equipment_category_id: Equipment::Category.find_by(type: 'belt').id,     attack: 0,   defense: 100, hp: 140, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/moon_belt.png"), artifact: true },
          { name: 'Moon sword',   equipment_category_id: Equipment::Category.find_by(type: 'weapon').id,   attack: 250, defense: 0,   hp: 0,   required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/moon_sword.png"), artifact: true },
          { name: 'Moon ring',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id,     attack: 15,  defense: 75,  hp: 140, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/moon_ring.png"), artifact: true },
          { name: 'Moon amulet',  equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0,   defense: 75,  hp: 135, required_level: 15,  price: 15000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/moon_amulet.png"), artifact: true }
        ]
      )
    end

    def seed_winged_god_set
      Equipment::Item.create!(
        [
          { name: 'Helm of Winged God',    equipment_category_id: Equipment::Category.find_by(type: 'helmet').id,   attack: 0,   defense: 135, hp: 200, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/helm_of_winged_god.png"), artifact: true },
          { name: 'Armor of Winged God',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id,    attack: 0,   defense: 125, hp: 220, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/armor_of_winged_god.png"), artifact: true },
          { name: 'Mail of Winged God',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id,     attack: 0,   defense: 110, hp: 240, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/mail_of_winged_god.png"), artifact: true },
          { name: 'Gloves of Winged God',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id,   attack: 30,  defense: 110, hp: 180, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/gloves_of_winged_god.png"), artifact: true },
          { name: 'Bracers of Winged God', equipment_category_id: Equipment::Category.find_by(type: 'bracers').id,  attack: 30,  defense: 110, hp: 180, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/bracers_of_winged_god.png"), artifact: true },
          { name: 'Boots of Winged God',   equipment_category_id: Equipment::Category.find_by(type: 'shoes').id,    attack: 30,  defense: 110, hp: 180, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/art/boots_of_winged_god.png"), artifact: true },
          { name: 'Belt of Winged God',    equipment_category_id: Equipment::Category.find_by(type: 'belt').id,     attack: 0,   defense: 100, hp: 160, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/belt_of_winged_god.png"), artifact: true },
          { name: 'Sword of Winged God',   equipment_category_id: Equipment::Category.find_by(type: 'weapon').id,   attack: 270, defense: 0,   hp: 0,   required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/sword_of_winged_god.png"), artifact: true },
          { name: 'Ring of Winged God',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id,     attack: 15,  defense: 90,  hp: 160, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/ring_of_winged_god.png"), artifact: true },
          { name: 'Amulet of Winged God',  equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0,   defense: 90,  hp: 150, required_level: 16,  price: 17000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amulet_of_winged_god.png"), artifact: true }
        ]
      )
    end

    def seed_amber_phoenix_set
      Equipment::Item.create!(
        [
          { name: 'Helm of Amber Phoenix',    equipment_category_id: Equipment::Category.find_by(type: 'helmet').id,   attack: 0,   defense: 140, hp: 220, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/helm_of_amber_phoenix.png"), artifact: true },
          { name: 'Armor of Amber Phoenix',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id,    attack: 0,   defense: 130, hp: 235, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/armor_of_amber_phoenix.png"), artifact: true },
          { name: 'Mail of Amber Phoenix',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id,     attack: 0,   defense: 115, hp: 255, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/mail_of_amber_phoenix.png"), artifact: true },
          { name: 'Gloves of Amber Phoenix',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id,   attack: 35,  defense: 115, hp: 195, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/gloves_of_amber_phoenix.png"), artifact: true },
          { name: 'Bracers of Amber Phoenix', equipment_category_id: Equipment::Category.find_by(type: 'bracers').id,  attack: 35,  defense: 115, hp: 195, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/bracers_of_amber_phoenix.png"), artifact: true },
          { name: 'Boots of Amber Phoenix',   equipment_category_id: Equipment::Category.find_by(type: 'shoes').id,    attack: 35,  defense: 115, hp: 195, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/art/boots_of_amber_phoenix.png"), artifact: true },
          { name: 'Belt of Amber Phoenix',    equipment_category_id: Equipment::Category.find_by(type: 'belt').id,     attack: 0,   defense: 100, hp: 175, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/belt_of_amber_phoenix.png"), artifact: true },
          { name: 'Axe of Amber Phoenix',     equipment_category_id: Equipment::Category.find_by(type: 'weapon').id,   attack: 300, defense: 0,   hp: 0,   required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/axe_of_amber_phoenix.png"), artifact: true },
          { name: 'Ring of Amber Phoenix',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id,     attack: 15,  defense: 100, hp: 180, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/ring_of_amber_phoenix.png"), artifact: true },
          { name: 'Amulet of Amber Phoenix',  equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0,   defense: 100, hp: 170, required_level: 17,  price: 19000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amulet_of_amber_phoenix.png"), artifact: true }
        ]
      )
    end

    def seed_emthyst_set
      Equipment::Item.create!(
        [
          { name: 'Amethyst helm',    equipment_category_id: Equipment::Category.find_by(type: 'helmet').id,   attack: 0,   defense: 140, hp: 240, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/amethyst_helm.png"), artifact: true },
          { name: 'Amethyst armor',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id,    attack: 0,   defense: 150, hp: 255, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/amethyst_armor.png"), artifact: true },
          { name: 'Amethyst mail',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id,     attack: 0,   defense: 125, hp: 270, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/amethyst_mail.png"), artifact: true },
          { name: 'Amethyst gloves',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id,   attack: 40,  defense: 125, hp: 220, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/amethyst_gloves.png"), artifact: true },
          { name: 'Amethyst bracers', equipment_category_id: Equipment::Category.find_by(type: 'bracers').id,  attack: 40,  defense: 125, hp: 215, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/amethyst_bracers.png"), artifact: true },
          { name: 'Amethyst boots',   equipment_category_id: Equipment::Category.find_by(type: 'shoes').id,    attack: 40,  defense: 125, hp: 215, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/art/amethyst_boots.png"), artifact: true },
          { name: 'Amethyst belt',    equipment_category_id: Equipment::Category.find_by(type: 'belt').id,     attack: 0,   defense: 100, hp: 190, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/amethyst_belt.png"), artifact: true },
          { name: 'Amethyst axe',     equipment_category_id: Equipment::Category.find_by(type: 'weapon').id,   attack: 330, defense: 0,   hp: 0,   required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/amethyst_axe.png"), artifact: true },
          { name: 'Amethyst ring',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id,     attack: 20,  defense: 105, hp: 200, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/amethyst_ring.png"), artifact: true },
          { name: 'Amethyst amulet',  equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0,   defense: 105, hp: 190, required_level: 18,  price: 21000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amethyst_amulet.png"), artifact: true }
        ]
      )
    end

    def seed_demon_warrior_set
      Equipment::Item.create!(
        [
          { name: 'Helm of Demon Warrior',    equipment_category_id: Equipment::Category.find_by(type: 'helmet').id,   attack: 0,   defense: 150, hp: 260, required_level: 19,  price: 23000, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/art/helm_of_demon_warrior.png"), artifact: true },
          { name: 'Armor of Demon Warrior',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id,    attack: 0,   defense: 155, hp: 265, required_level: 19,  price: 23000, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/art/armor_of_demon_warrior.png"), artifact: true },
          { name: 'Mail of Demon Warrior',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id,     attack: 0,   defense: 130, hp: 280, required_level: 19,  price: 23000, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/art/mail_of_demon_warrior.png"), artifact: true },
          { name: 'Gloves of Demon Warrior',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id,   attack: 45,  defense: 135, hp: 230, required_level: 19,  price: 23000, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/art/gloves_of_demon_warrior.png"), artifact: true },
          { name: 'Bracers of Demon Warrior', equipment_category_id: Equipment::Category.find_by(type: 'bracers').id,  attack: 45,  defense: 130, hp: 225, required_level: 19,  price: 23000, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/art/bracers_of_demon_warrior.png"), artifact: true },
          { name: 'Boots of Demon Warrior',   equipment_category_id: Equipment::Category.find_by(type: 'shoes').id,    attack: 45,  defense: 135, hp: 230, required_level: 19,  price: 23000, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/art/boots_of_demon_warrior.png"), artifact: true },
          { name: 'Belt of Demon Warrior',    equipment_category_id: Equipment::Category.find_by(type: 'belt').id,     attack: 0,   defense: 105, hp: 200, required_level: 19,  price: 23000, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/art/belt_of_demon_warrior.png"), artifact: true },
          { name: 'Sword of Demon Warrior',   equipment_category_id: Equipment::Category.find_by(type: 'weapon').id,   attack: 360, defense: 0,   hp: 0,   required_level: 19,  price: 23000, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/art/sword_of_demon_warrior.png"), artifact: true },
          { name: 'Ring of Demon Warrior',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id,     attack: 25,  defense: 110,  hp: 240, required_level: 19,  price: 23000, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/art/ring_of_demon_warrior.png"), artifact: true },
          { name: 'Amulet of Demon Warrior',  equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0,   defense: 110,  hp: 210, required_level: 19,  price: 23000, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/art/amulet_of_demon_warrior.png"), artifact: true }
        ]
      )
    end
  end
end
