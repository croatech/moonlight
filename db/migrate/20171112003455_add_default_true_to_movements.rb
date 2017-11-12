class AddDefaultTrueToMovements < ActiveRecord::Migration[5.1]
  def change
    change_column :movements, :s
  end
end
