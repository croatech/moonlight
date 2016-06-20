class AddFreeStatsToProfiles < ActiveRecord::Migration
  def change
    add_column :players, :free_stats, :integer, default: 10
    add_index :equipment_items, :category_id
  end
end
