class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :fight_id
      t.references :fight, index: true, foreign_key: true
      t.integer :player_damage
      t.integer :bot_damage
      t.integer :player_hp
      t.integer :bot_hp
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
