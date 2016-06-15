class AddUserStats < ActiveRecord::Migration
  def change
    add_column :profiles, :cash, :integer, default: 300
    add_column :profiles, :power, :integer, default: 1
    add_column :profiles, :defense, :integer, default: 1
    add_column :profiles, :hp, :integer, default: 20
    add_index :item_items, :category_id
  end
end
