class Asdk < ActiveRecord::Migration
  def change
    add_column :players, :lumberjacking_slot, :integer
    add_column :players, :fishing_slot, :integer
  end
end
