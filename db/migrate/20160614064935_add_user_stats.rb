class AddUserStats < ActiveRecord::Migration
  def change
    add_column :characters, :cash, :integer, default: 300
    add_column :characters, :power, :integer, default: 1
    add_column :characters, :defense, :integer, default: 1
    add_column :characters, :hp, :integer, default: 20
    add_index :item_items, :category_id
  end
end
