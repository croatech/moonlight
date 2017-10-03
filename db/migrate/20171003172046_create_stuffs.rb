class CreateStuffs < ActiveRecord::Migration[5.1]
  def change
    create_table :stuffs do |t|
      t.references :stuffable, polymorphic: true, index: true
      t.references :player, polymorphic: true, index: true
      t.timestamps
    end

    drop_table :player_equipment_items
    drop_table :player_tool_items
    drop_table :player_resources
  end
end
