class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :player_id
      t.references :player, index: true, foreign_key: true
      t.integer :bot_id
      t.references :bot, index: true, foreign_key: true
      t.string :winner_type
      t.integer :status, default: 0
      t.integer :dropped_gold
      t.integer :dropped_item

      t.timestamps null: false
    end
  end
end
