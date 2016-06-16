class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :location_id, default: 1
      t.integer :user_id
      t.references :location, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :head
      t.integer :chest
      t.integer :shoulders
      t.integer :hands
      t.integer :legs
      t.integer :weapon
      t.integer :shield
      t.integer :level, default: 1
      t.integer :exp, default: 0
      t.integer :exp_next, default: 100
      t.integer :gold,        default: 300
      t.integer :attack,      default: 1
      t.integer :defense,     default: 1
      t.integer :hp,          default: 20
      t.string  :inventory, array: true, default: '{}'

      t.timestamps null: false
    end
  end
end
