class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :player_id
      t.references :player, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
