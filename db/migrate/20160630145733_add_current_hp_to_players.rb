class AddCurrentHpToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :current_hp, :integer
  end
end
