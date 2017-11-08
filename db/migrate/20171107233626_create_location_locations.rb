class CreateLocationLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :location_locations do |t|
      t.integer :location_id, null: false
      t.integer :near_location_id, null: false

      t.timestamps
    end

    add_index :location_locations, :location_id
    add_index :location_locations, :near_location_id
  end
end
