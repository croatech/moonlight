class CreateLocationResources < ActiveRecord::Migration
  def change
    create_table :location_resources do |t|
      t.integer :location_id
      t.integer :resource_id
      t.references :location, index: true, foreign_key: true
      t.references :resource, index: true, foreign_key: true
    end

    add_index :resources, :item_id
  end
end
