class AddInactiveToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :inactive, :boolean, default: false
  end
end
