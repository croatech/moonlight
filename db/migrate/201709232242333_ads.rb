class Ads < ActiveRecord::Migration[5.1]
  def change
    create_table :players_equipment_items, id: false do |t|
      t.integer :player_id, null: false, foreign_key: true
      t.integer :item_id, null: false, foreign_key: true
    end

    add_index :players_equipment_items, :player_id
    add_index :players_equipment_items, :item_id

    create_table :players_tool_items, id: false do |t|
      t.integer :player_id, null: false, foreign_key: true
      t.integer :item_id, null: false, foreign_key: true
    end

    add_index :players_tool_items, :player_id
    add_index :players_tool_items, :item_id
  end
end
