class CreateEquipmentItems < ActiveRecord::Migration
  def change
    create_table :equipment_items do |t|
      t.string :name
      t.integer :category_id
      t.integer :attack, default: 0
      t.integer :defense, default: 0
      t.integer :hp, default: 0
      t.integer :required_level, default: 1
      t.integer :price
    end
  end
end
