class AddFreeStatsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :free_stats, :integer, default: 10
  end
end
