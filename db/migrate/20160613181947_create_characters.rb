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

      t.timestamps null: false
    end
  end
end
