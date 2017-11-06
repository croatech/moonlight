class AddWinnerableToFight < ActiveRecord::Migration[5.1]
  def change
    add_column :fights, :winner_id, :integer, foreign_key: true
    add_index :fights, :winner_id
    add_index :fights, :winner_type
  end
end
