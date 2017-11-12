class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :player, foreign_key: true, null: false
      t.text :text, null: false
      t.integer :recipient_id

      t.timestamps
    end
  end
end
