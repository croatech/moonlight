class CreateEquipmentCategories < ActiveRecord::Migration
  def change
    create_table :equipment_categories do |t|
      t.string :name
      t.string :slug
    end
  end
end
