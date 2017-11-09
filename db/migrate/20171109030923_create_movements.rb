class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.string :path, null: false, array: true
      t.references :player, foreign_key: true, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
