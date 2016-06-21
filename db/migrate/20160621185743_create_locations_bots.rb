class CreateLocationsBots < ActiveRecord::Migration
  def change
    create_table :locations_bots do |t|
      t.belongs_to :location, index: true
      t.belongs_to :bot, index: true
    end
  end
end
