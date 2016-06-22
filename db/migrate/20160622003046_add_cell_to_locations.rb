class AddCellToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :cell, :boolean, default: false
  end
end
