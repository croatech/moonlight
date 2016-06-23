class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :parent_id
      t.string :slug
      t.boolean :cell, default: false
    end
  end
end
