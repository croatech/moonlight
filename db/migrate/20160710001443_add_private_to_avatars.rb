class AddPrivateToAvatars < ActiveRecord::Migration
  def change
    add_column :avatars, :private, :boolean, default: true
  end
end
