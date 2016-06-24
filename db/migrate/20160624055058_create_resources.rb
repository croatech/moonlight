class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :item_id
      t.integer :price
      t.string :type
    end
  end
end
