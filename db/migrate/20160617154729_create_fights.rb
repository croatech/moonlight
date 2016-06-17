class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :player_id
      t.references :player, index: true, foreign_key: true
      t.integer :enemy_id
      t.integer :winner_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
