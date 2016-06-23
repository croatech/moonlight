class CreateToolCategories < ActiveRecord::Migration
  def change
    create_table :tool_categories do |t|
      t.string :name
      t.string :slug
    end
  end
end
