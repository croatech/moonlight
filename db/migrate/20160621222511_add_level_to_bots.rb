class AddLevelToBots < ActiveRecord::Migration
  def change
    add_column :bots, :level, :integer
  end
end
