class AddIndexToToolItems < ActiveRecord::Migration
  def change
    add_index :tool_items, :category_id
  end
end
