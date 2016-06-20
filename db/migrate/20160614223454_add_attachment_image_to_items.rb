class AddAttachmentImageToItems < ActiveRecord::Migration
  def self.up
    change_table :equipment_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :equipment_items, :image
  end
end
