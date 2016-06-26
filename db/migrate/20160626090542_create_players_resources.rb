class CreatePlayersResources < ActiveRecord::Migration
  def change
    create_table :players_resources, id: false do |t|
      t.belongs_to :player, index: true
      t.belongs_to :resource, index: true
    end
  end
end
