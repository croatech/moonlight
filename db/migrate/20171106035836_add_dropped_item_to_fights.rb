class AddDroppedItemToFights < ActiveRecord::Migration[5.1]
  def change
    remove_column :fights, :dropped_item
    add_column :fights, :dropped_item_id, :integer, foreign_key: true
    add_column :fights, :dropped_item_type, :string, foreign_key: true
    add_index :fights, :dropped_item_id
    add_index :fights, :dropped_item_type
  end
end
