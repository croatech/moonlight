class AddIndexes< ActiveRecord::Migration
  def change
    add_index :locations, :slug
    add_index :equipment_items, :category_id
    add_index :locations, :parent_id
    add_index :players, :user_id
  end
end
