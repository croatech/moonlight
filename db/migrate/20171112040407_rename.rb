class Rename < ActiveRecord::Migration[5.1]
  def change
    rename_table :logs, :events
  end
end
