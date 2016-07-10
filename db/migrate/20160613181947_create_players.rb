class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :location_id, default: 1
      t.integer :user_id
      t.references :location, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :avatar, index: true, foreign_key: true
      t.integer :helmet_slot
      t.integer :armor_slot
      t.integer :mail_slot
      t.integer :gloves_slot
      t.integer :bracers_slot
      t.integer :foots_slot
      t.integer :belt_slot
      t.integer :weapon_slot
      t.integer :shield_slot
      t.integer :ring_slot
      t.integer :necklace_slot
      t.integer :cloak_slot
      t.integer :pants_slot
      t.integer :level, default: 1
      t.integer :exp, default: 0
      t.integer :exp_next, default: 100
      t.integer :gold
      t.integer :attack,      default: 1
      t.integer :defense,     default: 1
      t.integer :current_hp
      t.integer :hp,          default: 20
      t.string  :equipment, array: true, default: '{}'
      t.integer :lumberjacking_skill, default: 0
      t.integer :fishing_skill, default: 0
      t.string  :tools, array: true, default: '{}'
      t.integer :lumberjacking_slot
      t.integer :fishing_slot
      t.integer :frame_size

      t.timestamps null: false
    end
  end
end
