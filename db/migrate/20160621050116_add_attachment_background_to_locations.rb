class AddAttachmentBackgroundToLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_attachment :locations, :background
  end
end
