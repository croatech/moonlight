class CreateToolsCategories < ActiveRecord::Migration
  def change
    create_table :tools_categories do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
