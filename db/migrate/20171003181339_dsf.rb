class Dsf < ActiveRecord::Migration[5.1]
  def change
    change_column :stuffs, :stuffable_id, :bigint, null: false
    change_column :stuffs, :player_id, :bigint, null: false
    change_column :stuffs, :stuffable_type, :string, null: false
  end
end
