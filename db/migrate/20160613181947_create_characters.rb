class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :location_id
      t.integer :user_id
      t.references :location, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :head
      t.integer :chest
      t.integer :shoulders
      t.integer :gloves
      t.integer :legs
      t.integer :weapon
      t.integer :level, default: 1
      t.integer :exp, default: 0
      t.integer :exp_next, default: 100
      t.integer :cash,        default: 300
      t.integer :attack,      default: 1
      t.integer :defense,     default: 1
      t.integer :hp,          default: 20

      t.timestamps null: false
    end
  end
end
