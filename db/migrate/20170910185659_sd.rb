class Sd < ActiveRecord::Migration[5.1]
  def change
    remove_column :equipment_items, :category_id, :integer
    add_reference :equipment_items, :equipment_category
  end
end
