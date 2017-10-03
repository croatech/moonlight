class Dsf < ActiveRecord::Migration[5.1]
  def change
    rename_table :players_equipment_items, :player_equipment_items
    rename_table :players_tool_items, :player_tool_items
    rename_table :players_resources, :player_resources
  end
end
