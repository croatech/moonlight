class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.string :name
      t.integer :attack
      t.integer :defense
      t.integer :hp
      t.integer :level
      t.string :inventory, array: true, default: '{}'

      t.timestamps null: false
    end
  end
end
