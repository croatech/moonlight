class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :equipment_categories, :slug, :type
    rename_column :tool_categories, :slug, :type
    remove_column :tool_items, :type
  end
end
