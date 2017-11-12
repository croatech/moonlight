class AddDefaultLocationToPlayer < ActiveRecord::Migration[5.1]
  def change
    change_column :players, :location_id, :integer, default: Location.find_by(name: 'Moon Light').id
  end
end
