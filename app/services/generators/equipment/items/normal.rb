module Generators::Equipment::Items::Normal
  class << self
    def call
      seed_helmets
      seed_chests
      seed_mails
      seed_gloves
      seed_bracers
      seed_shoes
      seed_belts
      seed_weapons
      seed_shields
      seed_rings
      seed_necklaces
      seed_cloaks
      seed_pants
      seed_croaton_set
    end

    def seed_helmets
      Equipment::Item.create!(
        [
          { name: 'Leather hat',      equipment_category_id: Equipment::Category.find_by(type: 'helmet').id, attack: 0, defense: 6,  hp: 6,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/leather_hat.png") },
          { name: 'Bone helm',        equipment_category_id: Equipment::Category.find_by(type: 'helmet').id, attack: 0, defense: 10, hp: 12, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/bone_helm.png") },
          { name: 'Scary mask',       equipment_category_id: Equipment::Category.find_by(type: 'helmet').id, attack: 0, defense: 15, hp: 16, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/scary_mask.png") },
          { name: 'Bloody helm',      equipment_category_id: Equipment::Category.find_by(type: 'helmet').id, attack: 0, defense: 20, hp: 20, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/bloody_helm.png") },
          { name: 'Gold helm',        equipment_category_id: Equipment::Category.find_by(type: 'helmet').id, attack: 0, defense: 25, hp: 24, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/gold_helm.png") },
          { name: 'Wiking helm',      equipment_category_id: Equipment::Category.find_by(type: 'helmet').id, attack: 0, defense: 30, hp: 29, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/wiking_helm.png") },
          { name: 'Mithrill helm',    equipment_category_id: Equipment::Category.find_by(type: 'helmet').id, attack: 0, defense: 35, hp: 35, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/mithrill_helm.png") },
          { name: 'Shell helm',       equipment_category_id: Equipment::Category.find_by(type: 'helmet').id, attack: 0, defense: 40, hp: 44, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/shell_helm.png") },
          { name: 'Holy helm',        equipment_category_id: Equipment::Category.find_by(type: 'helmet').id, attack: 0, defense: 45, hp: 51, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/holy_helm.png") },
          { name: 'Streamlined helm', equipment_category_id: Equipment::Category.find_by(type: 'helmet').id, attack: 0, defense: 50, hp: 55, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/helmet/streamlined_helm.png") }
        ]
      )
    end

    def seed_chests
      Equipment::Item.create!(
        [
          { name: 'Leather armor',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id, attack: 0, defense: 10, hp: 20,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/leather_armor.png") },
          { name: 'Bright armor',    equipment_category_id: Equipment::Category.find_by(type: 'armor').id, attack: 0, defense: 5,  hp: 15,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/bright_armor.png") },
          { name: 'Scary armor',     equipment_category_id: Equipment::Category.find_by(type: 'armor').id, attack: 0, defense: 11, hp: 20,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/scary_armor.png") },
          { name: 'Kvark armor',     equipment_category_id: Equipment::Category.find_by(type: 'armor').id, attack: 0, defense: 16, hp: 24,  required_level: 4,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/kvark_armor.png") },
          { name: 'Gold armor',      equipment_category_id: Equipment::Category.find_by(type: 'armor').id, attack: 0, defense: 20, hp: 29,  required_level: 5,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/gold_armor.png") },
          { name: 'Centuri armor',   equipment_category_id: Equipment::Category.find_by(type: 'armor').id, attack: 0, defense: 27, hp: 35,  required_level: 6,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/centuri_armor.png") },
          { name: 'Sea armor',       equipment_category_id: Equipment::Category.find_by(type: 'armor').id, attack: 0, defense: 30, hp: 44,  required_level: 7,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/sea_armor.png") },
          { name: 'Blueberry armor', equipment_category_id: Equipment::Category.find_by(type: 'armor').id, attack: 0, defense: 34, hp: 51,  required_level: 8,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/blueberry_armor.png") },
          { name: 'Holy armor',      equipment_category_id: Equipment::Category.find_by(type: 'armor').id, attack: 0, defense: 39, hp: 55,  required_level: 9,  price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/holy_armor.png") },
          { name: 'Elite armor',     equipment_category_id: Equipment::Category.find_by(type: 'armor').id, attack: 0, defense: 45, hp: 60, required_level: 10, price: 550, image: File.new("#{Rails.root}/db/seeds/equipment/items/armor/elite_armor.png") }
        ]
      )
    end

    def seed_mails
      Equipment::Item.create!(
        [
          { name: 'Fur Vest',       equipment_category_id: Equipment::Category.find_by(type: 'mail').id, attack: 0, defense: 10, hp: 20,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/fur_vest.png") },
          { name: 'Slinky mail',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id, attack: 0, defense: 5,  hp: 15,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/slinky_mail.png") },
          { name: 'Binded mail',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id, attack: 0, defense: 11, hp: 20,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/binded_mail.png") },
          { name: 'Assasin jacket', equipment_category_id: Equipment::Category.find_by(type: 'mail').id, attack: 0, defense: 16, hp: 24,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/assasin_jacket.png") },
          { name: 'Metal mail',     equipment_category_id: Equipment::Category.find_by(type: 'mail').id, attack: 0, defense: 20, hp: 29,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/metal_mail.png") },
          { name: 'Steel mail',     equipment_category_id: Equipment::Category.find_by(type: 'mail').id, attack: 0, defense: 27, hp: 35,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/steel_mail.png") },
          { name: 'Copper mail',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id, attack: 0, defense: 30, hp: 44,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/copper_mail.png") },
          { name: 'Sacred mail',    equipment_category_id: Equipment::Category.find_by(type: 'mail').id, attack: 0, defense: 34, hp: 51,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/sacred_mail.png") },
          { name: 'Kvark mail',     equipment_category_id: Equipment::Category.find_by(type: 'mail').id, attack: 0, defense: 39, hp: 55,  required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/kvark_mail.png") },
          { name: 'Earl mail',      equipment_category_id: Equipment::Category.find_by(type: 'mail').id, attack: 0, defense: 45, hp: 60, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/mail/earl_mail.png") }
        ]
      )
    end

    def seed_gloves
      Equipment::Item.create!(
        [
          { name: 'Leather gloves',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id, attack: 0,  defense: 10, hp: 20,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/leather_gloves.png") },
          { name: 'Elastic gloves',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id, attack: 2,  defense: 5,  hp: 15,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/elastic_gloves.png") },
          { name: 'Rubber gloves',   equipment_category_id: Equipment::Category.find_by(type: 'gloves').id, attack: 4,  defense: 11, hp: 20,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/rubber_gloves.png") },
          { name: 'Gloves of Rogue', equipment_category_id: Equipment::Category.find_by(type: 'gloves').id, attack: 6,  defense: 16, hp: 24,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/gloves_of_rogue.png") },
          { name: 'Spiked gloves',   equipment_category_id: Equipment::Category.find_by(type: 'gloves').id, attack: 8,  defense: 20, hp: 29,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/spiked_gloves.png") },
          { name: 'Steel gloves',    equipment_category_id: Equipment::Category.find_by(type: 'gloves').id, attack: 12, defense: 27, hp: 35,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/steel_gloves.png") },
          { name: 'Emerald gloves',  equipment_category_id: Equipment::Category.find_by(type: 'gloves').id, attack: 14, defense: 30, hp: 44,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/emerald_gloves.png") },
          { name: 'Titan gloves',    equipment_category_id: Equipment::Category.find_by(type: 'gloves').id, attack: 16, defense: 34, hp: 51,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/titan_gloves.png") },
          { name: 'Executor gloves', equipment_category_id: Equipment::Category.find_by(type: 'gloves').id, attack: 18, defense: 39, hp: 55,  required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/executor_gloves.png") },
          { name: 'Hedgehog gloves', equipment_category_id: Equipment::Category.find_by(type: 'gloves').id, attack: 20, defense: 45, hp: 60, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/gloves/hedgehog_gloves.png") }
        ]
      )
    end

    def seed_bracers
      Equipment::Item.create!(
        [
          { name: 'Leather bracers',     equipment_category_id: Equipment::Category.find_by(type: 'bracers').id, attack: 0,  defense: 5,  hp: 10, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/leather_bracers.png") },
          { name: 'Straw bracers',       equipment_category_id: Equipment::Category.find_by(type: 'bracers').id, attack: 1,  defense: 5,  hp: 15, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/straw_bracers.png") },
          { name: 'Light bracers',       equipment_category_id: Equipment::Category.find_by(type: 'bracers').id, attack: 2,  defense: 11, hp: 20, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/light_bracers.png") },
          { name: 'Elefant bracers',     equipment_category_id: Equipment::Category.find_by(type: 'bracers').id, attack: 3,  defense: 16, hp: 24, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/elefant_bracers.png") },
          { name: 'Emerald bracers',     equipment_category_id: Equipment::Category.find_by(type: 'bracers').id, attack: 4,  defense: 20, hp: 29, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/emerald_bracers.png") },
          { name: 'Golden bracers',      equipment_category_id: Equipment::Category.find_by(type: 'bracers').id, attack: 5,  defense: 27, hp: 35, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/golden_bracers.png") },
          { name: 'Spiked bracers',      equipment_category_id: Equipment::Category.find_by(type: 'bracers').id, attack: 6,  defense: 30, hp: 44, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/spiked_bracers.png") },
          { name: 'Holy bracers',        equipment_category_id: Equipment::Category.find_by(type: 'bracers').id, attack: 7,  defense: 34, hp: 51, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/holy_bracers.png") },
          { name: 'Titan bracers',       equipment_category_id: Equipment::Category.find_by(type: 'bracers').id, attack: 8,  defense: 39, hp: 55, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/titan_bracers.png") },
          { name: 'Unbreakable bracers', equipment_category_id: Equipment::Category.find_by(type: 'bracers').id, attack: 10, defense: 45, hp: 61, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/bracers/unbreakable_bracers.png") }
        ]
      )
    end

    def seed_shoes
      Equipment::Item.create!(
        [
          { name: 'Leather boots',      equipment_category_id: Equipment::Category.find_by(type: 'shoes').id, attack: 0,  defense: 5,  hp: 10, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/leather_boots.png") },
          { name: 'Straw shoes',        equipment_category_id: Equipment::Category.find_by(type: 'shoes').id, attack: 3,  defense: 5,  hp: 15, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/straw_shoes.png") },
          { name: 'Magic boots',        equipment_category_id: Equipment::Category.find_by(type: 'shoes').id, attack: 6,  defense: 11, hp: 20, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/magic_boots.png") },
          { name: 'Boots of Manticore', equipment_category_id: Equipment::Category.find_by(type: 'shoes').id, attack: 9,  defense: 16, hp: 24, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/boots_of_manticore.png") },
          { name: 'Ancient boots',      equipment_category_id: Equipment::Category.find_by(type: 'shoes').id, attack: 12, defense: 20, hp: 29, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/ancient_boots.png") },
          { name: 'Boots of Executor',  equipment_category_id: Equipment::Category.find_by(type: 'shoes').id, attack: 15, defense: 27, hp: 35, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/boots_of_executor.png") },
          { name: 'Spiked boots',       equipment_category_id: Equipment::Category.find_by(type: 'shoes').id, attack: 18, defense: 30, hp: 44, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/spiked_boots.png") },
          { name: 'Holy boots',         equipment_category_id: Equipment::Category.find_by(type: 'shoes').id, attack: 21, defense: 34, hp: 51, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/holy_boots.png") },
          { name: 'Titan boots',        equipment_category_id: Equipment::Category.find_by(type: 'shoes').id, attack: 24, defense: 39, hp: 55, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/titan_boots.png") },
          { name: 'Kvark boots',        equipment_category_id: Equipment::Category.find_by(type: 'shoes').id, attack: 26, defense: 45, hp: 63, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/shoes/kvark_boots.png") }
        ]
      )
    end

    def seed_belts
      Equipment::Item.create!(
        [
          { name: 'Rag belt',          equipment_category_id: Equipment::Category.find_by(type: 'belt').id, attack: 0, defense: 5,  hp: 10,  required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/rag_belt.png") },
          { name: 'Warm belt',         equipment_category_id: Equipment::Category.find_by(type: 'belt').id, attack: 0, defense: 5,  hp: 15,  required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/warm_belt.png") },
          { name: 'Motley belt',       equipment_category_id: Equipment::Category.find_by(type: 'belt').id, attack: 0, defense: 11, hp: 20,  required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/motley_belt.png") },
          { name: 'Spiked belt',       equipment_category_id: Equipment::Category.find_by(type: 'belt').id, attack: 0, defense: 16, hp: 24,  required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/spiked_belt.png") },
          { name: 'Ancient belt',      equipment_category_id: Equipment::Category.find_by(type: 'belt').id, attack: 0, defense: 20, hp: 29,  required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/ancient_belt.png") },
          { name: 'Belt of Executor',  equipment_category_id: Equipment::Category.find_by(type: 'belt').id, attack: 0, defense: 27, hp: 35,  required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/belt_of_executor.png") },
          { name: 'Spiked belt',       equipment_category_id: Equipment::Category.find_by(type: 'belt').id, attack: 0, defense: 30, hp: 44,  required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/spiked_belt.png") },
          { name: 'Holy belt',         equipment_category_id: Equipment::Category.find_by(type: 'belt').id, attack: 0, defense: 34, hp: 51,  required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/holy_belt.png") },
          { name: 'Titan belt',        equipment_category_id: Equipment::Category.find_by(type: 'belt').id, attack: 0, defense: 39, hp: 55,  required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/titan_belt.png") },
          { name: 'Kvark belt',        equipment_category_id: Equipment::Category.find_by(type: 'belt').id, attack: 0, defense: 45, hp: 63, required_level: 10, price: 500,  image: File.new("#{Rails.root}/db/seeds/equipment/items/belt/kvark_belt.png") }
        ]
      )
    end

    def seed_weapons
      Equipment::Item.create!(
        [
          { name: 'Metal axe',       equipment_category_id: Equipment::Category.find_by(type: 'weapon').id, attack: 11,  defense: 0, hp: 0, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/metal_axe.png") },
          { name: 'Light axe',       equipment_category_id: Equipment::Category.find_by(type: 'weapon').id, attack: 21,  defense: 0, hp: 0, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/light_axe.png") },
          { name: 'Rapid axe',       equipment_category_id: Equipment::Category.find_by(type: 'weapon').id, attack: 31,  defense: 0, hp: 0, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/rapid_axe.png") },
          { name: 'Rough axe',       equipment_category_id: Equipment::Category.find_by(type: 'weapon').id, attack: 41,  defense: 0, hp: 0, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/rough_axe.png") },
          { name: 'Round axe',       equipment_category_id: Equipment::Category.find_by(type: 'weapon').id, attack: 51,  defense: 0, hp: 0, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/round_axe.png") },
          { name: 'Kvark axe',       equipment_category_id: Equipment::Category.find_by(type: 'weapon').id, attack: 61,  defense: 0, hp: 0, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/kvark_axe.png") },
          { name: 'Spiked axe',      equipment_category_id: Equipment::Category.find_by(type: 'weapon').id, attack: 71,  defense: 0, hp: 0, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/spiked_axe.png") },
          { name: 'Great axe',       equipment_category_id: Equipment::Category.find_by(type: 'weapon').id, attack: 81,  defense: 0, hp: 0, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/great_axe.png") },
          { name: 'Duke axe',        equipment_category_id: Equipment::Category.find_by(type: 'weapon').id, attack: 91,  defense: 0, hp: 0, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/duke_axe.png") },
          { name: 'Destructive axe', equipment_category_id: Equipment::Category.find_by(type: 'weapon').id, attack: 101, defense: 0, hp: 0, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/weapon/destructive_axe.png") }
        ]
      )
    end

    def seed_shields
      Equipment::Item.create!(
        [
          { name: 'Wood shield',        equipment_category_id: Equipment::Category.find_by(type: 'shield').id, attack: 0, defense: 20,  hp: 15, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/wood_shield.png") },
          { name: 'Blueberry shield',   equipment_category_id: Equipment::Category.find_by(type: 'shield').id, attack: 0, defense: 30,  hp: 20, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/blueberry_shield.png") },
          { name: 'Spartan shield',     equipment_category_id: Equipment::Category.find_by(type: 'shield').id, attack: 0, defense: 40,  hp: 24, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/spartan_shield.png") },
          { name: 'Duke shield',        equipment_category_id: Equipment::Category.find_by(type: 'shield').id, attack: 0, defense: 50,  hp: 29, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/duke_shield.png") },
          { name: 'Bright shield',      equipment_category_id: Equipment::Category.find_by(type: 'shield').id, attack: 0, defense: 60,  hp: 35, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/bright_shield.png") },
          { name: 'Spiked shield',      equipment_category_id: Equipment::Category.find_by(type: 'shield').id, attack: 0, defense: 70,  hp: 44, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/spiked_shield.png") },
          { name: 'Round shield',       equipment_category_id: Equipment::Category.find_by(type: 'shield').id, attack: 0, defense: 80,  hp: 51, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/round_shield.png") },
          { name: 'Gnoll shield',       equipment_category_id: Equipment::Category.find_by(type: 'shield').id, attack: 0, defense: 90,  hp: 55, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/gnoll_shield.png") },
          { name: 'Shield of executor', equipment_category_id: Equipment::Category.find_by(type: 'shield').id, attack: 0, defense: 100, hp: 63, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/shield_of_executor.png") },
          { name: 'Griever shield',     equipment_category_id: Equipment::Category.find_by(type: 'shield').id, attack: 0, defense: 110, hp: 70, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/shield/griever_shield.png") }
        ]
      )
    end

    def seed_rings
      Equipment::Item.create!(
        [
          { name: 'Wood ring',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id, attack: 0,  defense: 5,  hp: 10, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/wood_ring.png") },
          { name: 'Ugly ring',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id, attack: 2,  defense: 8,  hp: 15, required_level: 2,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/ugly_ring.png") },
          { name: 'Lucky ring',   equipment_category_id: Equipment::Category.find_by(type: 'ring').id, attack: 4,  defense: 11, hp: 20, required_level: 3,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/lucky_ring.png") },
          { name: 'Sphere ring',  equipment_category_id: Equipment::Category.find_by(type: 'ring').id, attack: 6,  defense: 16, hp: 24, required_level: 4,  price: 200, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/sphere_ring.png") },
          { name: 'Magic ring',   equipment_category_id: Equipment::Category.find_by(type: 'ring').id, attack: 8,  defense: 20, hp: 29, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/magic_ring.png") },
          { name: 'Ancient ring', equipment_category_id: Equipment::Category.find_by(type: 'ring').id, attack: 10, defense: 27, hp: 35, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/ancient_ring.png") },
          { name: 'Elf ring',     equipment_category_id: Equipment::Category.find_by(type: 'ring').id, attack: 12, defense: 30, hp: 44, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/elf_ring.png") },
          { name: 'Holy ring',    equipment_category_id: Equipment::Category.find_by(type: 'ring').id, attack: 14, defense: 34, hp: 51, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/holy_ring.png") },
          { name: 'Titan ring',   equipment_category_id: Equipment::Category.find_by(type: 'ring').id, attack: 16, defense: 39, hp: 55, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/titan_ring.png") },
          { name: 'Kvark ring',   equipment_category_id: Equipment::Category.find_by(type: 'ring').id, attack: 18, defense: 45, hp: 63, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/ring/kvark_ring.png") }
        ]
      )
    end

    def seed_necklaces
      Equipment::Item.create!(
        [
          { name: 'Bone amulet',      equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0, defense: 5,  hp: 10, required_level: 1,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/bone_amulet.png") },
          { name: 'Stone amulet',     equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0, defense: 6,  hp: 15, required_level: 2,  price: 50,  image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/stone_amulet.png") },
          { name: 'Emerald amulet',   equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0, defense: 11, hp: 20, required_level: 3,  price: 100, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/emerald_amulet.png") },
          { name: 'Satanic amulet',   equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0, defense: 16, hp: 24, required_level: 4,  price: 150, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/satanic_amulet.png") },
          { name: 'Ancient necklace', equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0, defense: 20, hp: 29, required_level: 5,  price: 250, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/ancient_amulet.png") },
          { name: 'Sunny amulet',     equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0, defense: 27, hp: 35, required_level: 6,  price: 300, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/sunny_amulet.png") },
          { name: 'Spiked amulet',    equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0, defense: 30, hp: 44, required_level: 7,  price: 350, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/spiked_amulet.png") },
          { name: 'Weird amulet',     equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0, defense: 34, hp: 51, required_level: 8,  price: 400, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/weird_amulet.png") },
          { name: 'Round amulet',     equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0, defense: 39, hp: 55, required_level: 9,  price: 450, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/round_amulet.png") },
          { name: 'Draenei amulet',   equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0, defense: 45, hp: 57, required_level: 10, price: 500, image: File.new("#{Rails.root}/db/seeds/equipment/items/necklace/draenei_amulet.png") }
        ]
      )
    end

    def seed_cloaks
      Equipment::Item.create!(
        [
          { name: 'Tramp cloak',     equipment_category_id: Equipment::Category.find_by(type: 'cloak').id, attack: 0,  defense: 5,  hp: 10,  required_level: 1,  price: 50,    image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/tramp_cloak.png") },
          { name: 'Gilded cloak',    equipment_category_id: Equipment::Category.find_by(type: 'cloak').id, attack: 0,  defense: 10, hp: 20,  required_level: 5,  price: 500,   image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/gilded_cloak.png") },
          { name: 'Dementor cloak',  equipment_category_id: Equipment::Category.find_by(type: 'cloak').id, attack: 0,  defense: 20, hp: 40,  required_level: 10, price: 2500,  image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/dementor_cloak.png") },
          { name: 'Snake cloak',     equipment_category_id: Equipment::Category.find_by(type: 'cloak').id, attack: 0,  defense: 40, hp: 50,  required_level: 15, price: 5000,  image: File.new("#{Rails.root}/db/seeds/equipment/items/cloak/snake_cloak.png") }
        ]
      )
    end

    def seed_pants
      Equipment::Item.create!(
        [
          { name: 'Leather pants',    equipment_category_id: Equipment::Category.find_by(type: 'pants').id, attack: 0,  defense: 5,  hp: 5,    required_level: 1,  price: 50,   image: File.new("#{Rails.root}/db/seeds/equipment/items/pants/leather_pants.png") },
          { name: 'Warm pants',       equipment_category_id: Equipment::Category.find_by(type: 'pants').id, attack: 0,  defense: 50, hp: 50,   required_level: 5,  price: 500,  image: File.new("#{Rails.root}/db/seeds/equipment/items/pants/warm_pants.png") },
          { name: 'Spectral pants',   equipment_category_id: Equipment::Category.find_by(type: 'pants').id, attack: 0,  defense: 100, hp: 55,  required_level: 10, price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/pants/spectral_pants.png") },
          { name: 'Pants of warrior', equipment_category_id: Equipment::Category.find_by(type: 'pants').id, attack: 0,  defense: 200, hp: 200, required_level: 20, price: 5000, image: File.new("#{Rails.root}/db/seeds/equipment/items/pants/pants_of_warrior.png") }
        ]
      )
    end

    def seed_croaton_set
      Equipment::Item.create!(
        [
          { name: 'Cape of Croaton',   equipment_category_id: Equipment::Category.find_by(type: 'cloak').id,    attack: 0,   defense: 66, hp: 666, required_level: 1, price: 50000000, image: File.new("#{Rails.root}/db/seeds/equipment/items/croaton/cape_of_croaton.png"), artifact: true },
          { name: 'Judgment Day',      equipment_category_id: Equipment::Category.find_by(type: 'weapon').id,   attack: 666, defense: 66, hp: 666, required_level: 1, price: 50000000, image: File.new("#{Rails.root}/db/seeds/equipment/items/croaton/judgment_day.png"), artifact: true },
          { name: 'Death Note',        equipment_category_id: Equipment::Category.find_by(type: 'shield').id,   attack: 666, defense: 66, hp: 666, required_level: 1, price: 50000000, image: File.new("#{Rails.root}/db/seeds/equipment/items/croaton/death_note.png"), artifact: true },
          { name: 'Amulet of Croaton', equipment_category_id: Equipment::Category.find_by(type: 'necklace').id, attack: 0,   defense: 66, hp: 666, required_level: 1, price: 50000000, image: File.new("#{Rails.root}/db/seeds/equipment/items/croaton/amulet_of_croaton.png"), artifact: true }
        ]
      )
    end
  end
end
